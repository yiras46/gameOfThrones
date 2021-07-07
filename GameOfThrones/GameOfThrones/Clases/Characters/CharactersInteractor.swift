//
//  CharactersInteractor.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 06/07/21.
//

import Foundation

class CharactersInteractor: PresenterToInteractorCharactersProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterCharactersProtocol?
    var characters: [Character]?
    
    
    func loadCharacters() {
        CategoryDetailService.shared.getCharacters(success: { (code, characters) in
            self.characters = characters
            self.presenter?.fetchCharactersSuccess(characters: characters)
        }) { (code) in
            self.presenter?.fetchCharactersFailure(errorCode: code)
        }
    }

}


