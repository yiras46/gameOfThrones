//
//  BooksRouter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit

class BooksRouter: PresenterToRouterBooksProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        let viewController = BooksViewController()
        
        let presenter: ViewToPresenterBooksProtocol & InteractorToPresenterBooksProtocol = BooksPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = BooksRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = BooksInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
