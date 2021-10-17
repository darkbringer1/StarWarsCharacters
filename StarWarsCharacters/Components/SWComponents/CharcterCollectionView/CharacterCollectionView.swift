//
//  CharacterCollectionView.swift
//  StarWarsCharacters
//
//  Created by DarkBringer on 17.10.2021.
//

import UIKit
import BaseComponents

class CharacterCollectionView: GenericBaseView<CharacterCollectionViewData> {
    
    
    private var delegateProtocol: CharacterCollectionViewProtocol?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .orange
        collection.delegate = self
        collection.dataSource = self
        collection.keyboardDismissMode = .onDrag
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.genericRegisterCell(CharacterCollectionViewCell.self)
        return collection
    }()
    
    override init(frame: CGRect = .zero, data: CharacterCollectionViewData? = nil) {
        super.init(frame: frame, data: data)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addCollectionView()
    }
    
    func addCollectionView() {
        addSubview(collectionView)
        
        collectionView.backgroundColor = .gray
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor)
            
        ])
    }
    
    func setupDelegation(with delegate: CharacterCollectionViewProtocol) {
        self.delegateProtocol = delegate
    }
    
    func reloadCollecionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}

extension CharacterCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        delegateProtocol?.getNumberOfSection() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegateProtocol?.getItemCount(in: section) ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = delegateProtocol?.getData(at: indexPath.row) else { fatalError() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.identifier, for: indexPath) as? CharacterCollectionViewCell else { fatalError() }
        cell.setRowData(data: data)
        return cell
    }
    
    
}
extension CharacterCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (UIScreen.main.bounds.height - 50) / 5
        let width = UIScreen.main.bounds.width - 20
        return CGSize(width: width, height: height)
    }
    
}
