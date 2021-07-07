//
//  CategoriesRouter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit

class CategoriesRouter:PresenterToRouterCategoriesProtocol{
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        let viewController = CategoriesViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        let presenter: ViewToPresenterCategoriesProtocol & InteractorToPresenterCategoriesProtocol = CategoriesPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = CategoriesRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = CategoriesInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return navigationController
    }
    
    // MARK: - Navigation
    func pushToCategoryDetail(on view: PresenterToViewCategoriesProtocol, with category: Category) {
        
        var detailViewController : UIViewController?
        
        switch category.categoryName{
        
        case CategoryType.Books.rawValue:
            detailViewController = BooksRouter.createModule()
            break
            
        case CategoryType.Characters.rawValue:
            detailViewController = CharactersRouter.createModule()
            break
            
        case CategoryType.Houses.rawValue:
            detailViewController = HousesRouter.createModule()
            break
            
        default:
            detailViewController = BooksRouter.createModule()
        }
        
            
        let viewController = view as! CategoriesViewController
        viewController.navigationController?.pushViewController(detailViewController!, animated: true)
        
    }
    
}
