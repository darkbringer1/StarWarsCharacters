//
//  CharacterListResponseModel.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation

struct CharacterListResponseModel: Codable {
    
    let result: [SWCharacter]
    
}
