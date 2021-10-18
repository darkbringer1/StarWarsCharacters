//
//  CharacterSimpleLineComponent.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import UIKit
import BaseComponents

class CharacterSimpleLineComponent: GenericBaseView<CharacterSimpleLineComponentData> {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .clear
        return temp
    }()
    
    private lazy var lineLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.textColor = .white
        temp.text = " "
        temp.contentMode = .left
        temp.textAlignment = .left
        return temp
    }()
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        addLineComponents()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        lineLabel.text = data.lineValue
    }
    
    private func addLineComponents() {
        addSubview(containerView)
        containerView.addSubview(lineLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            lineLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            lineLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            lineLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            lineLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
        ])
    }
}
