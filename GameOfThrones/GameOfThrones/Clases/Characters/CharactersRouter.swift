//
//  CharactersRouter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import UIKit

class CharactersRouter: PresenterToRouterCharactersProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = CharactersViewController()
        
        let presenter: ViewToPresenterCharactersProtocol & InteractorToPresenterCharactersProtocol = CharactersPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CharactersRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CharactersInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}


