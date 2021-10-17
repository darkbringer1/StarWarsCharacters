//
//  StarWarsAPIRemoteProtocol.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

typealias CharacterListResultBlock = (Result<CharacterListResponseModel, ErrorResponse>) -> Void
typealias CharacterResultBlock = (Result<SWCharacter, ErrorResponse>) -> Void
typealias CharacterListResult = Result<CharacterListResponseModel, ErrorResponse>


protocol StarWarsAPIRemoteProtocol {
    
    func getCharacterById(id: Int, with completion: @escaping CharacterResultBlock)
    
    func getCharacterList(id: Int, with completion: @escaping CharacterListResultBlock)

}
