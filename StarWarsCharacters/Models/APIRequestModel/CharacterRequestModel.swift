//
//  CharacterRequestModel.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation

struct CharacterRequestModel: Codable {
    private(set) var characterID: Int = 1
    
    init(characterID: Int = 1) {
        self.characterID = characterID
    }
}
