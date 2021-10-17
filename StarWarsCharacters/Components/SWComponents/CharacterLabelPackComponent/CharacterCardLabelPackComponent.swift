//
//  CharacterCardLabelPackComponent.swift
//  RickAndMorty
//
//  Created by Emircan Aydın on 14.10.2021.
//

import UIKit
import BaseComponents

class CharacterCardLabelPackComponent: GenericBaseView<CharacterCardLabelPackData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [nameLabel, heightLabel, homeworldLabel, speciesLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    private lazy var nameLabel: CharacterSimpleLineComponent = {
        let temp = CharacterSimpleLineComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var heightLabel: CharacterSimpleLineComponent = {
        let temp = CharacterSimpleLineComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var homeworldLabel: CharacterSimpleLineComponent = {
        let temp = CharacterSimpleLineComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var speciesLabel: CharacterSimpleLineComponent = {
        let temp = CharacterSimpleLineComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        nameLabel.setData(by: data.nameLabel)
        heightLabel.setData(by: data.heightLabel)
        homeworldLabel.setData(by: data.homeworldLabel)
        speciesLabel.setData(by: data.speciesLabel)
    }
    
    private func addUserComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
        ])
        
    }
}
