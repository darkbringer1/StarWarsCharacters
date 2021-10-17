//
//  CharacterCollectionComponentProtocol.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import BaseComponents

protocol CharacterCollectionViewProtocol: AnyObject {
    
    func getNumberOfSection() -> Int
    func getItemCount(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    
}
