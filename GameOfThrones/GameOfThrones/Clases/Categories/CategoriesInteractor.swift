//
//  CategoriesInteractor.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import Foundation

class CategoriesInteractor: PresenterToInteractorCategoriesProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCategoriesProtocol?
    var categories: [Category]?
    
    func loadCategories() {
        
        
        if (UserDefaults.standard.object(forKey: "Categories") != nil){
            
            self.categories = [Category].init(JSONString: UserDefaults.standard.object(forKey: "Categories") as! String)
            self.presenter?.fetchCategoriesSuccess(categories: self.categories!)
            
        }else{
            CategoryService.shared.getCategories(success: { (code, categories) in
                self.categories = categories

                UserDefaults.standard.set(categories.toJSONString(prettyPrint:false), forKey: "Categories")
                
                self.presenter?.fetchCategoriesSuccess(categories: categories)
            }) { (code) in
                self.presenter?.fetchCategoriesFailure(errorCode: code)
            }
        }
    }
    
    func clickCategory(at index: Int) {
        guard let categories = self.categories, categories.indices.contains(index) else {
            self.presenter?.getCategoryFailure()
            return
        }
        self.presenter?.showCategory(self.categories![index])
    }

}
