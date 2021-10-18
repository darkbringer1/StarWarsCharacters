//
//  UICollectionView+Extension.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import Foundation
import UIKit
import BaseComponents

extension UICollectionView {
    
    func genericRegisterCell<T>(_ type: T.Type) where T: BaseCollectionViewCell {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
}
