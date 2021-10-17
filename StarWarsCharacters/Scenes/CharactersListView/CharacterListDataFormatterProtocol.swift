//
//  CharacterListDataFormatterProtocol.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import BaseComponents

protocol CharacterListDataFormatterProtocol {
    
    func getItem(from data: SWCharacter) -> GenericDataProtocol
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    func getCount() -> Int
    
    func getData(at index: Int) -> SWCharacter
    
    func setData(with response: CharacterListResponseModel)
    
    func setData(with list: [SWCharacter])
    
}
