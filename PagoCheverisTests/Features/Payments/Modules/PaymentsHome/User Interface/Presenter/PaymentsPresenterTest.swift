//
//  PaymentsPresenterTest.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import PagoCheveris

final class PaymentsPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A Payments Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: PaymentsInteractorInput {
    }

    private class MockRouter: PaymentsRouterInput {
    }

    private class MockView: PaymentsViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> PaymentsModuleInput {

            return PaymentsPresenter()
	    }
    }
}
