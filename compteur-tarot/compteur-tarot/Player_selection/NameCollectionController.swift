//
//  NameCollectionController.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit



class NameCollectionController: UIViewController {
    private let reuseIdentifier = "PlayerNameInput"
    @IBOutlet var CollectionView: UICollectionView!
    
    var nb_players: Int = 4
    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionView.dataSource = self
        CollectionView.register(PlayerNameInput.nib(), forCellWithReuseIdentifier: reuseIdentifier)
    
    } // Permet de passer le nombre de joueurs et leurs noms au tableau des scores

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
        print("oui")
        return cell
    }
}

