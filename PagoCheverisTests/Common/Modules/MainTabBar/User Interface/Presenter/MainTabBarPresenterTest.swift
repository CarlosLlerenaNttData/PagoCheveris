//
//  MainTabBarPresenterTest.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import PagoCheveris

final class MainTabBarPresenterTest: QuickSpec {

    override func spec() {
        beforeEach {
        }

        afterEach {
        }

        describe("A MainTabBar Presenter") {
        }
    }


    // MARK: Mock Classes

    private class MockInteractor: MainTabBarInteractorInput {
    }

    private class MockRouter: MainTabBarRouterInput {
    }

    private class MockView: MainTabBarViewInput {

        func setUpInitialState() {
        }

        func moduleInput() -> MainTabBarModuleInput {

            return MainTabBarPresenter()
	    }
    }
}
