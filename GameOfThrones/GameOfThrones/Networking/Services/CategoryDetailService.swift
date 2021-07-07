//
//  CategoryDetailService.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import ObjectMapper

class CategoryDetailService{
    
    static let shared = { CategoryDetailService() }()
    
    func getBooks(success: @escaping (Int, [Book]) -> (), failure: @escaping (Int) -> ()) {
        
        APIClient.shared.getArray(urlString: Endpoints.CATEGORY_DETAIL + "/\(Resources.BOOKS)", success: { (code, arrayOfBooks) in
            success(code, arrayOfBooks)
            
        }) { (code) in
            failure(code)
        }
    }
    
    func getHouses(success: @escaping (Int, [House]) -> (), failure: @escaping (Int) -> ()) {
        
        APIClient.shared.getArray(urlString: Endpoints.CATEGORY_DETAIL + "/\(Resources.HOUSES)", success: { (code, arrayOfHouses) in
            success(code, arrayOfHouses)
            
        }) { (code) in
            failure(code)
        }
    }
    
    func getCharacters(success: @escaping (Int, [Character]) -> (), failure: @escaping (Int) -> ()) {
        
        APIClient.shared.getArray(urlString: Endpoints.CATEGORY_DETAIL + "/\(Resources.CHARACTERS)", success: { (code, arrayOfCharacters) in
            success(code, arrayOfCharacters)
            
        }) { (code) in
            failure(code)
        }
    }
}
