//
//  NameCollectionController.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit

// Actuellement l'affichage n'est pas beau (superposé) mais au moins ça s'affiche
// Le StackView semble limiter la place prise

class NameCollectionController: UIViewController {
    private let reuseIdentifier = "PlayerNameInput"
    @IBOutlet var CollectionView: UICollectionView!
    
    var nb_players: Int = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.register(PlayerNameInput.nib(), forCellWithReuseIdentifier: reuseIdentifier)
    
    }

}

extension NameCollectionController: UICollectionViewDataSource {
    
    /*func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    } */


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlayerNameInput
        cell.configure(with: indexPath.item)
        return cell
    }
}


