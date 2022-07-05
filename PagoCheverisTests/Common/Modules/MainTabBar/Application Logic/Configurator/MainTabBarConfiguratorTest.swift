//
//  MainTabBarConfiguratorTest.swift
//  PagoCheveris
//
//  Created by Carlos Llerena on 05/07/2022.
//  Copyright © 2022 NTT DATA Europe & Latam. All rights reserved.
//

import Nimble
import Quick

@testable import PagoCheveris

final class MainTabBarModuleConfiguratorTest: QuickSpec {

    override func spec() {
        var viewController: MainTabBarViewControllerMock!
        var configurator: MainTabBarModuleConfigurator!

        beforeEach {
            viewController = MainTabBarViewControllerMock()

            configurator = MainTabBarModuleConfigurator()
            configurator.configureModuleForViewInput(viewController)
        }

        afterEach {
            viewController = nil
            configurator = nil
        }

        describe("A MainTabBarModuleConfigurator") {
            it("should configure the viewController") {
                expect(viewController.output).toNot(beNil())
                expect(viewController.output).to(beAKindOf(MainTabBarPresenter.self))
            }

            it("should configure the presenter") {
                let presenter = viewController.output as? MainTabBarPresenter

                expect(presenter?.view).toNot(beNil())
                expect(presenter?.view).to(beAKindOf(MainTabBarViewController.self))

                expect(presenter?.router).toNot(beNil())
                expect(presenter?.router).to(beAKindOf(MainTabBarRouter.self))

                expect(presenter?.interactor).toNot(beNil())
                expect(presenter?.interactor).to(beAKindOf(MainTabBarInteractor.self))
            }

            it("should configure the interactor") {
                let presenter = viewController.output as? MainTabBarPresenter
                let interactor = presenter?.interactor as? MainTabBarInteractor

                expect(interactor?.output).toNot(beNil())
                expect(interactor?.output).to(beAKindOf(MainTabBarPresenter.self))
            }
        }
    }


    // MARK: Mock Classes

    private class MainTabBarViewControllerMock: MainTabBarViewController {
    }
}
