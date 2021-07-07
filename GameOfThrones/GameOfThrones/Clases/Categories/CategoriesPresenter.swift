//
//  CategoriesPresenter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit

class CategoriesPresenter: ViewToPresenterCategoriesProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewCategoriesProtocol?
    var interactor: PresenterToInteractorCategoriesProtocol?
    var router: PresenterToRouterCategoriesProtocol?
    
    var categoriesStrings: [String]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadCategories()
    }
    
    func refresh() {
        interactor?.loadCategories()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let categoriesStrings = self.categoriesStrings else {
            return 1
        }
        
        return categoriesStrings.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let categoriesStrings = self.categoriesStrings else {
            return nil
        }
        
        return categoriesStrings[indexPath.row]
    }

    
    func didSelectRowAt(index: Int) {
        interactor?.clickCategory(at: index)
    }
    
    func deselectRowAt(index: Int) {
        view?.deselectRowAt(row: index)
    }
    
}

// MARK: - Outputs to view
extension CategoriesPresenter: InteractorToPresenterCategoriesProtocol {
    
    func fetchCategoriesSuccess(categories: [Category]) {
        self.categoriesStrings = categories.compactMap { $0.categoryName }
        view?.hideHUD()
        view?.onFetchCategoriesSuccess()
    }
    
    func fetchCategoriesFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchCategoriesFailure(error: "fetchCategoriesFailure: \(errorCode)")
    }
    
    func showCategory(_ category: Category) {
        router?.pushToCategoryDetail(on: view!, with: category)
    }
    
    func getCategoryFailure() {
        view?.hideHUD()
        print("getCategoryFailure")
    }
    
    
}
