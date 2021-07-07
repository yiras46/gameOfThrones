//
//  CharactersPresenter.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import UIKit

class CharactersPresenter: ViewToPresenterCharactersProtocol {
    func didSelectRowAt(index: Int) {
        
    }
    
    func deselectRowAt(index: Int) {
        
    }
    
    
    // MARK: Properties
    weak var view: PresenterToViewCharactersProtocol?
    var interactor: PresenterToInteractorCharactersProtocol?
    var router: PresenterToRouterCharactersProtocol?
    
    var characters: [Character]?
    
    // MARK: Inputs from view
    func viewDidLoad() {
        view?.showHUD()
        interactor?.loadCharacters()
    }
    
    func refresh() {
        interactor?.loadCharacters()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let characters = self.characters else {
            return 0
        }
        
        return characters.count
    }
    
    func textLabelText(indexPath: IndexPath) -> String? {
        guard let characters = self.characters else {
            return nil
        }
        
        return characters[indexPath.row].name
    }
    
    func textDetailLabelText(indexPath: IndexPath) -> String? {
        guard let characters = self.characters else {
            return nil
        }
        
        if(characters[indexPath.row].died!.isEmpty){
            return "Currently alive"
        }else{
            return "Died: \(characters[indexPath.row].died ?? "")"
        }
    }
    
}

// MARK: - Outputs to view
extension CharactersPresenter: InteractorToPresenterCharactersProtocol {
    
    func fetchCharactersSuccess(characters: [Character]) {
        self.characters = characters
        view?.hideHUD()
        view?.onFetchCharactersSuccess()
    }
    
    func fetchCharactersFailure(errorCode: Int) {
        view?.hideHUD()
        view?.onFetchCharactersFailure(error: "fetchCharactersFailure: \(errorCode)")
    }
}


