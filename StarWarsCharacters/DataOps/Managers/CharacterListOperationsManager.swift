//
//  CharacterListOperationsManager.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import RxSwift
import DefaultNetworkOperationPackage

class CharacterListOperationsManager: CharacterListOperationsManagerProtocol {
    
    
    public static let shared = CharacterListOperationsManager()
    
    private init() {}
    
    private let dataPublishSubject = PublishSubject<CharacterListResult>()
    
    func getCharacterListData() {
        let characterListRequest = CharacterListRequestModel()
        fireApiCall(request: characterListRequest, with: apiCallHandler)
    }

    func subscribeDataPublisher(with completion: @escaping CharacterListResultBlock) -> Disposable {
        return dataPublishSubject.subscribe(onNext: completion)
    }
    
    private func fireApiCall(request: CharacterListRequestModel, with completion: @escaping CharacterListResultBlock) {
        do {
            let urlRequest = try CharacterListRequestServiceProvider(request: request).returnUrlRequest()
            
            APIManager.shared.executeRequest(urlRequest: urlRequest, completion: completion)
        } catch let error {
            print("ERROR IN OPERATIONS MANAGER 'fireApiCall' : \(error)")
        }
    }
    private lazy var apiCallHandler: CharacterListResultBlock = { [weak self] result in
        self?.dataPublishSubject.onNext(result)
    }
}
