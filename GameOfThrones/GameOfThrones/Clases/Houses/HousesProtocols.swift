//
//  HousesContract.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewHousesProtocol: AnyObject {
    func onFetchHousesSuccess()
    func onFetchHousesFailure(error: String)
    
    func showHUD()
    func hideHUD()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterHousesProtocol: AnyObject {
    
    var view: PresenterToViewHousesProtocol? { get set }
    var interactor: PresenterToInteractorHousesProtocol? { get set }
    var router: PresenterToRouterHousesProtocol? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    var houses: [House]? { get }
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    func textDetailLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorHousesProtocol: AnyObject {
    
    var presenter: InteractorToPresenterHousesProtocol? { get set }
    func loadHouses()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterHousesProtocol: AnyObject {

    func fetchHousesSuccess(houses: [House])
    func fetchHousesFailure(errorCode: Int)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterHousesProtocol: AnyObject {
    
    static func createModule() -> UIViewController
}


