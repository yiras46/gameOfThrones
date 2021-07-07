//
//  BooksContract.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewBooksProtocol: AnyObject {
    func onFetchBooksSuccess()
    func onFetchBooksFailure(error: String)
    
    func showHUD()
    func hideHUD()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterBooksProtocol: AnyObject {
    
    var view: PresenterToViewBooksProtocol? { get set }
    var interactor: PresenterToInteractorBooksProtocol? { get set }
    var router: PresenterToRouterBooksProtocol? { get set }
    
    func viewDidLoad()
    
    func refresh()
    
    func numberOfRowsInSection() -> Int
    func textLabelText(indexPath: IndexPath) -> String?
    func textDetailLabelText(indexPath: IndexPath) -> String?
    
    func didSelectRowAt(index: Int)
    func deselectRowAt(index: Int)

}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorBooksProtocol: AnyObject {
    
    var presenter: InteractorToPresenterBooksProtocol? { get set }
    
    func loadBooks()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterBooksProtocol: AnyObject {
    
    func fetchBooksSuccess(books: [Book])
    func fetchBooksFailure(errorCode: Int)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterBooksProtocol: AnyObject {
    
    static func createModule() -> UIViewController
}

