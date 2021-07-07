//
//  HousesInteractor.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import Foundation

class HousesInteractor: PresenterToInteractorHousesProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterHousesProtocol?
    var houses: [House]?
    
    
    func loadHouses() {
        CategoryDetailService.shared.getHouses(success: { (code, houses) in
            self.houses = houses
            self.presenter?.fetchHousesSuccess(houses: houses)
        }) { (code) in
            self.presenter?.fetchHousesFailure(errorCode: code)
        }
    }

}

