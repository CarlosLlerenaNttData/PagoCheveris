//
//  SessionService.swift
//  PagoCheveris
//
//  Created by Carlos Alfredo Llerena Huayta on 12/07/22.
//

protocol SessionServiceProvider {
    
    var sessionId: String? { get set }
    
    func refreshSessionId(sessionId: String)
}

final class SessionService: SessionServiceProvider {
    
    static var shared: SessionServiceProvider = SessionService()
    
    var sessionId: String?
    
    func refreshSessionId(sessionId: String) {
        self.sessionId = sessionId
    }
}
