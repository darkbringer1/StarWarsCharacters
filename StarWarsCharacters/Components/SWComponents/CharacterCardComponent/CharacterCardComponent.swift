//
//  CharacterCardComponent.swift
//  RickAndMorty
//
//  Created by Emircan Aydın on 14.10.2021.
//

import UIKit
import BaseComponents
class CharacterCardComponent: GenericBaseView<GenericDataProtocol> {
    
    private lazy var shadowContainer: UIView = {
         let temp = UIView()
         temp.translatesAutoresizingMaskIntoConstraints = false
         temp.layer.shadowColor = UIColor.black.cgColor
         temp.layer.shadowOffset = CGSize(width: 0, height: 2)
         temp.layer.shadowRadius = 6
         temp.layer.shadowOpacity = 0.6
         temp.layer.cornerRadius = 6
         return temp
     }()
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 6
        temp.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        temp.clipsToBounds = true
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [imageViewComponent, labelPackComponent])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 10
        return temp
    }()
    
    private lazy var imageViewComponent: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalToConstant: 200).isActive = true
        temp.layer.masksToBounds = true
        temp.layer.borderWidth = 10
        temp.layer.cornerRadius = 10
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.6
        return temp
    }()
    
    private lazy var circleCutout: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        
        return temp
    }()
    
    private lazy var labelPackComponent: CharacterCardLabelPackComponent = {
        let temp = CharacterCardLabelPackComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() as? CharacterCardData else { return }
        imageViewComponent.setData(by: data.imageData)
        labelPackComponent.setData(by: data.labelPackData)
    }
    
    private func addUserComponents() {
        addSubview(shadowContainer)
        shadowContainer.addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            shadowContainer.topAnchor.constraint(equalTo: topAnchor),
            shadowContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            shadowContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            containerView.topAnchor.constraint(equalTo: shadowContainer.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: shadowContainer.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: shadowContainer.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: shadowContainer.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
        ])
        
    }
}
