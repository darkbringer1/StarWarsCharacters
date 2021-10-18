//
//  CharacterCardLabelPackData.swift
//  RickAndMorty
//
//  Created by Emircan Aydın on 14.10.2021.
//

import Foundation

class CharacterCardLabelPackData {

    private(set) var nameLabel: CharacterSimpleLineComponentData
    private(set) var name2Label: CharacterSimpleLineComponentData
    private(set) var heightLabel: CharacterSimpleLineComponentData
    private(set) var homeworldLabel: CharacterSimpleLineComponentData
    private(set) var speciesLabel: CharacterSimpleLineComponentData
    
    init(nameLabel: CharacterSimpleLineComponentData,
         name2Label: CharacterSimpleLineComponentData,
         heightLabel: CharacterSimpleLineComponentData,
         homeworldLabel: CharacterSimpleLineComponentData,
         speciesLabel: CharacterSimpleLineComponentData) {
        self.nameLabel = nameLabel
        self.name2Label = name2Label
        self.heightLabel = heightLabel
        self.homeworldLabel = homeworldLabel
        self.speciesLabel = speciesLabel
        
    }
    
}
