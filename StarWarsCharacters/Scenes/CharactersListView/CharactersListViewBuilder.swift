//
//  CharactersListViewBuilder.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import UIKit

class CharactersListViewBuilder {
    
    class func build() -> UIViewController {
        let characterListFormatter = CharacterListViewDataGetter()
        let manager = CharacterListOperationsManager.shared
        let viewModel = CharactersListViewModel(formatter: characterListFormatter, opManager: manager)
        let viewController = CharactersListViewController(viewModel: viewModel)
        return viewController
    }
    
}
