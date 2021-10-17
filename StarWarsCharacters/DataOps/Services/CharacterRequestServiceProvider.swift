//
//  CharacterRequestServiceProvider.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterRequestServiceProvider: ApiServiceProvider<CharacterRequestModel> {
    
    init(request: CharacterRequestModel) {
        super.init(
            method: .get,
            baseUrl: BaseURL.main.description,
            path: Paths.characterWithID(request.characterID).description,
            data: nil)
    }
    
}
