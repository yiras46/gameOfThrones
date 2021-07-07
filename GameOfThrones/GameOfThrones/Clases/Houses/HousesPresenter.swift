//
//  HousesPresenter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import UIKit

class HousesPresenter: ViewToPresenterHousesProtocol {
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
    
    
    // MARK: Properties
    weak var view: PresenterToViewHousesProtocol?
    var interactor: PresenterToInteractorHousesProtocol?
    var router: PresenterToRouterHousesProtocol?
    
    var houses: [House]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadHouses()
    }
    
    func refresh() {
        interactor?.loadHouses()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let houses = self.houses else {
            return 0
        }
        
        return houses.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let houses = self.houses else {
            return nil
        }
        
        
        return "\(houses[indexPath.row].name ?? "") - \(houses[indexPath.row].region ?? "")"
    }
    
    func textDetailLabelText(indexPath: IndexPath) -> String? {
        guard let houses = self.houses else {
            return nil
        }
        
        return houses[indexPath.row].title
    }
    
}

// MARK: - Outputs to view
extension HousesPresenter: InteractorToPresenterHousesProtocol {
    
    func fetchHousesSuccess(houses: [House]) {
        self.houses = houses
        view?.hideHUD()
        view?.onFetchHousesSuccess()
    }
    
    func fetchHousesFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchHousesFailure(error: "fetchHousesFailure: \(errorCode)")
    }
}

