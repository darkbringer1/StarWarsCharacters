//
//  GenericCollectionViewCell.swift
//  RickAndMorty
//
//  Created by DarkBringer on 17.10.2021.
//

import UIKit
import BaseComponents

class GenericCollectionViewCell<DataType, ViewType: GenericBaseView123<DataType>>: BaseCollectionViewCell {
    
    lazy var genericView: ViewType = {
        let temp = ViewType()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    
    
    override func addMajorViews() {
        super.addMajorViews()
        
        contentView.addSubview(genericView)
        
        NSLayoutConstraint.activate([
        
            genericView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            genericView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            genericView.topAnchor.constraint(equalTo: contentView.topAnchor),
            genericView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        
        ])
    }
    
    func setRowData(data: DataType) {
        genericView.setData(by: data)
    }
    
}

open class GenericBaseView123<T>: BaseView123 {
    
    private var data: T?
    
    public init(frame: CGRect = .zero, data: T? = nil) {
        self.data = data
        super.init(frame: frame)
        loadDataView()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    open func loadDataView() { }
    
    open func setData(by value: T?) {
        self.data = value
        loadDataView()
    }
    
    open func returnData() -> T? {
        return data
    }
    
}

open class BaseView123: UIView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addMajorViewComponents()
        setupViewConfigurations()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViewComponents()
        setupViewConfigurations()
    }
    
    open func addMajorViewComponents() { }
    open func setupViewConfigurations() { }
    
}

