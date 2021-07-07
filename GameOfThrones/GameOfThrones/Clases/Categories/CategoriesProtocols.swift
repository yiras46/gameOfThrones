//
//  CategoriesContract.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCategoriesProtocol: AnyObject {
    func onFetchCategoriesSuccess()
    func onFetchCategoriesFailure(error: String)
    
    func showHUD()
    func hideHUD()
    
    func deselectRowAt(row: Int)
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCategoriesProtocol: AnyObject {
    
    var view: PresenterToViewCategoriesProtocol? { get set }
    var interactor: PresenterToInteractorCategoriesProtocol? { get set }
    var router: PresenterToRouterCategoriesProtocol? { get set }
    
    var categoriesStrings: [String]? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCategoriesProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCategoriesProtocol? { get set }
    
    func loadCategories()
    func clickCategory(at index: Int)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCategoriesProtocol: AnyObject {
    
    func fetchCategoriesSuccess(categories: [Category])
    func fetchCategoriesFailure(errorCode: Int)
    
    func showCategory(_ category: Category)
    func getCategoryFailure()
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCategoriesProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
    
    func pushToCategoryDetail(on view: PresenterToViewCategoriesProtocol, with category: Category)
}

