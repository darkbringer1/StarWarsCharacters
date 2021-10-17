//
//  CharacterCardLabelPackData.swift
//  RickAndMorty
//
//  Created by Emircan Aydın on 14.10.2021.
//

import Foundation

class CharacterCardLabelPackData {

    private(set) var nameLabel: CharacterSimpleLineComponentData
    private(set) var heightLabel: CharacterSimpleLineComponentData
    private(set) var homeworldLabel: CharacterSimpleLineComponentData
    private(set) var speciesLabel: CharacterSimpleLineComponentData
    
    init(nameLabel: CharacterSimpleLineComponentData,
         heightLabel: CharacterSimpleLineComponentData,
         homeworldLabel: CharacterSimpleLineComponentData,
         speciesLabel: CharacterSimpleLineComponentData) {
        self.nameLabel = nameLabel
        self.heightLabel = heightLabel
        self.homeworldLabel = homeworldLabel
        self.speciesLabel = speciesLabel
        
    }
    
}
