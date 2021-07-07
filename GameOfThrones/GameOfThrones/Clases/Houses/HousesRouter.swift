//
//  HousesRouter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import UIKit

class HousesRouter: PresenterToRouterHousesProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = HousesViewController()
        
        let presenter: ViewToPresenterHousesProtocol & InteractorToPresenterHousesProtocol = HousesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HousesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HousesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}

