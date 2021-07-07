//
//  CategoryService.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import ObjectMapper

class CategoryService{
    
    static let shared = { CategoryService() }()
    
    func getCategories(success: @escaping (Int, [Category]) -> (), failure: @escaping (Int) -> ()) {
        
        APIClient.shared.getArray(urlString: Endpoints.CATEGORIES, success: { (code, arrayOfQuotes) in
            success(code, arrayOfQuotes)
            
        }) { (code) in
            failure(code)
        }
    }
}
