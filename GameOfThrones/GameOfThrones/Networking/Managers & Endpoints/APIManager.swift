//
//  APIManager.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return "https://private-anon-e9b9f1e5d2-androidtestmobgen.apiary-mock.com/"
    }()
}
