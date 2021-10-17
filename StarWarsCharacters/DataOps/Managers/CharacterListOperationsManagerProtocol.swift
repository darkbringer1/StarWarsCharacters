//
//  CharacterListOperationsManagerProtocol.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import RxSwift

protocol CharacterListOperationsManagerProtocol {
    
    func getCharacterListData()
    
    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable
    
    
}
