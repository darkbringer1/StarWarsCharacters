//
//  CharacterListRequestService.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListRequestServiceProvider: ApiServiceProvider<CharacterListRequestModel> {
    
    init(request: CharacterListRequestModel) {
        super.init(
            method: .get,
            baseUrl: BaseURL.main.description,
            path: Paths.allCharacters.description,
            data: nil)
    }
    
}
