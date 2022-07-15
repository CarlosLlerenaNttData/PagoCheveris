//
//  PCQrReadView.swift
//  
//
//  Created by Carlos Alfredo Llerena Huayta on 14/07/22.
//

import UIKit
import AVFoundation
import FLAnimatedImage

public protocol PCQrReadDelegate: AnyObject {
    func didQrResponse(code: String)
}

class PCQrReadViewController: UIViewController {
    
    var isLoading: Bool = false
    var activityIndicatorView: UIActivityIndicatorView?
    weak var delegate: PCQrReadDelegate?
    var opaqueView = UIView()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var indicationLabel: UILabel!
    
    private var captureSession: AVCaptureSession = AVCaptureSession()
    private let sessionQueue = DispatchQueue(label: "Capture Session Queue")
    
    fileprivate var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCaptureSession()
    }
    
    private func setupCaptureSession() {
        sessionQueue.sync {
            self.captureSession.beginConfiguration()
            
            let output = AVCaptureMetadataOutput()
            
            if let device = AVCaptureDevice.default(for: .video),
               let input = try? AVCaptureDeviceInput(device: device),
               self.captureSession.canAddInput(input) && self.captureSession.canAddOutput(output) {
                
                self.captureSession.addInput(input)
                self.captureSession.addOutput(output)
                
                output.metadataObjectTypes = [
                    .aztec,
                    .code39,
                    .code39Mod43,
                    .code93,
                    .code128,
                    .dataMatrix,
                    .ean8,
                    .ean13,
                    .interleaved2of5,
                    .itf14,
                    .interleaved2of5,
                    .pdf417,
                    .qr,
                    .upce
                ]
                
                output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            }
            
            
            self.captureSession.commitConfiguration()
            
            DispatchQueue.main.async {
                self.setupPreviewLayer(session: self.captureSession)
                self.setupBoundingBox()
            }
            
            self.captureSession.startRunning()
        }
    }
    
    private func setupPreviewLayer(session: AVCaptureSession) {
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = containerView.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        
        containerView.layer.addSublayer(previewLayer)
    }
    
    @objc func removeOpaqueView(){
        
        self.opaqueView.removeFromSuperview()
    }
    
    func closeButtonAdd(){
        let button = UIButton(frame: CGRect(x: 8, y: 8, width: 45, height: 45))
        button.setImage(UIImage(named: "CloseWhite"), for: .normal)
        button.addTarget(self, action: #selector(removeOpaqueView), for: .touchUpInside)
        opaqueView.addSubview(button)
        
    }
    
    func addViewTutor() {
        opaqueView = UIView(frame:self.view.frame)
        opaqueView.frame.origin =  CGPoint(x: 0, y: 70)
        opaqueView.frame.size =  CGSize(width:opaqueView.frame.size.width, height:opaqueView.frame.size.height - 70)
        opaqueView.backgroundColor = .black
        opaqueView.alpha = 0.8
        
        let imageView2 = FLAnimatedImageView(frame:CGRect(x: (opaqueView.frame.width/2) - 40, y: (opaqueView.frame.height/2) - 40, width: 80, height: 80))
        
        
        let path1 : String = Bundle.main.path(forResource: "rotateicon", ofType: "gif")!
        let url = URL(fileURLWithPath: path1)
        do {
            let gifData = try Data(contentsOf: url)
            let imageData1 =  FLAnimatedImage(animatedGIFData: gifData)
            
            imageView2.animatedImage = imageData1
            imageView2.center = opaqueView.center
        }catch {
            
        }
        
        imageView2.frame = CGRect(x: (opaqueView.frame.width/2) - 40, y: (opaqueView.frame.height/2) - 40, width: 80, height: 80)
        
        let title = UILabel(frame:CGRect(x: 0, y: imageView2.frame.origin.y - 50 , width: opaqueView.frame.width, height: 30))
        
        
        title.font = UIFont.boldSystemFont(ofSize: 13)
        title.textColor = .white
        title.textAlignment = .center
        title.numberOfLines = 3
        title.text = "Puedes escanear tus códigos en cualquier orientación"
        
        
        opaqueView.addSubview(title)
        //opaqueView.addSubview(infoText)
        opaqueView.addSubview(imageView2)
        
        self.view.addSubview(opaqueView)
    }
    
    @objc func handleCloseButtonTap(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true)
    }
    
    // MARK - Bounding Box
    private var boundingBox = CAShapeLayer()
    
    private func setupBoundingBox() {
        boundingBox.frame = containerView.layer.bounds
        boundingBox.strokeColor = UIColor.red.cgColor
        boundingBox.lineWidth = 4.0
        boundingBox.fillColor = UIColor.clear.cgColor
        
        containerView.layer.addSublayer(boundingBox)
    }
    
    fileprivate func updateBoundingBox(_ points: [CGPoint]) {
        guard let firstPoint = points.first else {
            return
        }
        
        let path = UIBezierPath()
        path.move(to: firstPoint)
        
        var newPoints = points
        newPoints.removeFirst()
        newPoints.append(firstPoint)
        
        newPoints.forEach { path.addLine(to: $0) }
        
        boundingBox.path = path.cgPath
        boundingBox.isHidden = false
    }
    
    private var resetTimer: Foundation.Timer?
    fileprivate func hideBoundingBox(after: Double) {
        resetTimer?.invalidate()
        resetTimer = Foundation.Timer.scheduledTimer(withTimeInterval: TimeInterval() + after, repeats: false) {
            [weak self] (timer) in
            self?.resetViews()
            
        }
    }
    func found(code: String) {
        print(code)
        
        dismiss(animated: true,completion: {
            self.delegate?.didQrResponse(code: code)
        })
    }
    
    private func resetViews() {
        boundingBox.isHidden = true
        // resultsLabel.text = nil
    }
}

extension PCQrReadViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            //   self.resultsLabel.text = object.stringValue
            if let dato = object.stringValue {
                found(code:dato)
                captureSession.stopRunning()
            }
            guard let transformedObject = previewLayer.transformedMetadataObject(for: object) as? AVMetadataMachineReadableCodeObject else {
                return
            }
            
            updateBoundingBox(transformedObject.corners)
            hideBoundingBox(after: 0.25)
        }
    }
}
