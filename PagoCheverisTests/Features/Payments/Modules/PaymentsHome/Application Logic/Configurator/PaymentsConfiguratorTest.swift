//
//  PaymentsConfiguratorTest.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import PagoCheveris

final class PaymentsModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: PaymentsViewControllerMock!
        var configurator: PaymentsModuleConfigurator!

        beforeEach {
            viewController = PaymentsViewControllerMock()

            configurator = PaymentsModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A PaymentsModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(PaymentsPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? PaymentsPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(PaymentsViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(PaymentsRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(PaymentsInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? PaymentsPresenter
                let interactor = presenter?.interactor as? PaymentsInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(PaymentsPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class PaymentsViewControllerMock: PaymentsViewController {
    }
}
