//
//  CharactersListViewController.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 16.10.2021.
//

import UIKit
import BaseComponents

class  CharactersListViewController: BaseViewController<CharactersListViewModel> {
    
    deinit {
        print("DEINIT CharactersListViewController")
    }
    
    private var mainComponent: CharacterCollectionView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        viewModel.getCharacterList()
        subscribeViewModelListeners()
        addMainComponent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavController()
    }
    
    
    
    
    func addMainComponent() {
        mainComponent = CharacterCollectionView()
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        
        mainComponent.setupDelegation(with: viewModel)
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func subscribeViewModelListeners(){
        viewModel.subscribeState { [weak self] state in
            switch state {
                case .done:
                    print("data is ready")
                    self?.mainComponent.reloadCollecionView()
                case .loading:
                    print("data is loading")
                case .failure:
                    print("error")
            }
        }
    }
    
    private func setupNavController() {
        
        let navCont = self.navigationController
        
        navCont?.setNavigationBarHidden(false, animated: true)
        navCont?.navigationBar.barStyle = .black
        navCont?.navigationBar.isTranslucent = false
        
        let image = UIImage(named: "starwars")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
        
    }
}


