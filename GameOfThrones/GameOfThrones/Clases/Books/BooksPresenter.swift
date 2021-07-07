//
//  BooksPresenter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import UIKit

class BooksPresenter: ViewToPresenterBooksProtocol {
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
    
    
    // MARK: Properties
    weak var view: PresenterToViewBooksProtocol?
    var interactor: PresenterToInteractorBooksProtocol?
    var router: PresenterToRouterBooksProtocol?
    
    var books: [Book]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadBooks()
    }
    
    func refresh() {
        interactor?.loadBooks()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let books = self.books else {
            return 0
        }
        
        return books.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let books = self.books else {
            return nil
        }
        
        return books[indexPath.row].name
    }
    
    func textDetailLabelText(indexPath: IndexPath) -> String? {
        guard let books = self.books else {
            return nil
        }
        
        return "\(books[indexPath.row].publisher ?? "") - \(books[indexPath.row].country ?? ""). Pages: \(books[indexPath.row].numberOfPages ?? 0)"
    }
    
}

// MARK: - Outputs to view
extension BooksPresenter: InteractorToPresenterBooksProtocol {
    
    func fetchBooksSuccess(books: [Book]) {
        self.books = books
        view?.hideHUD()
        view?.onFetchBooksSuccess()
    }
    
    func fetchBooksFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchBooksFailure(error: "Couldn't get categories: \(errorCode)")
    }
}
