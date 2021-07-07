//
//  BooksInteractor.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import Foundation

class BooksInteractor: PresenterToInteractorBooksProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterBooksProtocol?
    var books: [Book]?
    
    func loadBooks() {
        CategoryDetailService.shared.getBooks(success: { (code, books) in
            self.books = books
            self.presenter?.fetchBooksSuccess(books: books)
        }) { (code) in
            self.presenter?.fetchBooksFailure(errorCode: code)
        }
    }
}
