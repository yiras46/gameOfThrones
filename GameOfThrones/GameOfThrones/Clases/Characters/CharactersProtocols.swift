//
//  CharactersContract.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewCharactersProtocol: AnyObject {
    func onFetchCharactersSuccess()
    func onFetchCharactersFailure(error: String)
    
    func showHUD()
    func hideHUD()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterCharactersProtocol: AnyObject {
    
    var view: PresenterToViewCharactersProtocol? { get set }
    var interactor: PresenterToInteractorCharactersProtocol? { get set }
    var router: PresenterToRouterCharactersProtocol? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    func textDetailLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorCharactersProtocol: AnyObject {
    
    var presenter: InteractorToPresenterCharactersProtocol? { get set }
    func loadCharacters()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterCharactersProtocol: AnyObject {

    func fetchCharactersSuccess(characters: [Character])
    func fetchCharactersFailure(errorCode: Int)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterCharactersProtocol: AnyObject {
    
    static func createModule() -> UIViewController
}



