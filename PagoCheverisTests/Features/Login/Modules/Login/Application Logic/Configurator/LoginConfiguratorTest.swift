//
//  LoginConfiguratorTest.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import PagoCheveris

final class LoginModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: LoginViewControllerMock!
        var configurator: LoginModuleConfigurator!

        beforeEach {
            viewController = LoginViewControllerMock()

            configurator = LoginModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A LoginModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(LoginPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? LoginPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(LoginViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(LoginRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(LoginInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? LoginPresenter
                let interactor = presenter?.interactor as? LoginInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(LoginPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class LoginViewControllerMock: LoginViewController {
    }
}
