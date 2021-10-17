//
//  CharacterListViewDataGetter.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import BaseComponents

class CharacterListViewDataGetter: CharacterListDataFormatterProtocol {
    
    
    private var data: CharacterListResponseModel!
    private var list: [SWCharacter] = [SWCharacter]()
    
    func getItem(from data: SWCharacter) -> GenericDataProtocol {
        return CharacterCardData(imageData: CustomImageViewComponentData(imageUrl: data.image!),
                                 labelPackData: CharacterCardLabelPackData(
                                    nameLabel: CharacterSimpleLineComponentData(lineValue: data.name!),
                                    heightLabel: CharacterSimpleLineComponentData(lineValue: String(data.height ?? 999)),
                                    homeworldLabel: CharacterSimpleLineComponentData(lineValue: data.homeworld ?? "Unknown"),
                                    speciesLabel: CharacterSimpleLineComponentData(lineValue: data.species ?? "Unknown")))
    }
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        return list.count - 1
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func getData(at index: Int) -> SWCharacter {
        return list[index]
    }
    
    func setData(with response: CharacterListResponseModel) {
        self.data = response
        self.list.append(contentsOf: response.result)
    }
    
    func setData(with list: [SWCharacter]) {
        self.list = list
    }
}
