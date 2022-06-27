//
//  LoginPresenterTest.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 26/06/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import PagoCheveris

final class LoginPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A Login Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: LoginInteractorInput {
    }

    private class MockRouter: LoginRouterInput {
    }

    private class MockView: LoginViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> LoginModuleInput {

            return LoginPresenter()
	    }
    }
}
