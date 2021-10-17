//
//  StarWarsApiRemote.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import UIKit
import DefaultNetworkOperationPackage

class StarWarsApiRemote: StarWarsAPIRemoteProtocol {
    
    
    func getCharacterList(id: Int, with completion: @escaping CharacterListResultBlock) {
        do {
            let characterListRequest = CharacterListRequestModel()
            let urlRequest = try CharacterListRequestServiceProvider(request: characterListRequest).returnUrlRequest()
            print(urlRequest.description)
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch {
            print("ERROR IN API REMOTE 'getCharacterList' : \(error)")
        }
    }
    
    func getCharacterById(id: Int, with completion: @escaping CharacterResultBlock) {
        do {
            let characterRequest = CharacterRequestModel(characterID: id)
            let urlRequest = try CharacterRequestServiceProvider(request: characterRequest).returnUrlRequest()
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch {
            print("ERROR IN API REMOTE 'getCharacterById' : \(error)")
        }
    }
    
    
}
