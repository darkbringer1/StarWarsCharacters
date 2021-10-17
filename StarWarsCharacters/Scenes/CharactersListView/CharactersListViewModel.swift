//
//  CharactersListViewModel.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import UIKit
import RxSwift
import BaseComponents

class CharactersListViewModel {
    
    deinit {
        print("DEINIT CharacterListViewModel")
    }
    
    private let disposeBag = DisposeBag()
    private let formatter: CharacterListDataFormatterProtocol
    private let opManager: CharacterListOperationsManagerProtocol
    private var data: CharacterListResponseModel?
    private var state: CharacterListStateBlock?
    
    init(formatter: CharacterListDataFormatterProtocol, opManager: CharacterListOperationsManagerProtocol) {
        self.formatter = formatter
        self.opManager = opManager
        subscribeOperationManagerPublisher()
    }
    
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    func getCharacterList() {
        state?(.loading)
        opManager.getCharacterListData()
    }
    private func dataHandler(with response: CharacterListResponseModel) {
        data = response
        state?(.done)
    }
    private func subscribeOperationManagerPublisher() {
        opManager.subscribeDataPublisher { [weak self] result in
            switch result {
                case .failure(let error):
                    print("ERROR IN THE CHARACTERSVM 'subscribeOperationManagerPublisher' \(error)")
                case .success(let response):
                    self?.formatter.setData(with: response)
                    self?.dataHandler(with: response)
            }
        }.disposed(by: disposeBag)
    }
}

extension CharactersListViewModel: CharacterCollectionViewProtocol {
    
    func getNumberOfSection() -> Int {
        return formatter.getNumberOfSection()
    }
    
    func getItemCount(in section: Int) -> Int {
        return formatter.getNumbeOfItem(in: section)
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return formatter.getItem(from: formatter.getData(at: index))
    }
    
}
