//
//  ScoreController.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 04/05/2021.
//

import UIKit

class ScoreController: UIViewController {
    
    @IBOutlet var CollectionView: UICollectionView!
    
    var width: CGFloat = 0.0
    var joueurName: [String] = []
    var nb_players: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        width = CollectionView.bounds.width
        
        CollectionView.dataSource  = self // Permet de gérer ce qui est afficher
        CollectionView.register(GameOutputCell.nib(), forCellWithReuseIdentifier: GameOutputCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: width/5, height: width/5)
        layout.sectionInset = UIEdgeInsets(top: layout.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
            // Le but est d'avoir 5 cellules par lignes, mais ça ne marche pas
        CollectionView.collectionViewLayout = layout
    }

}
//Permet de sélectionnier ce qui est afficher
extension ScoreController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    } // Permet de spécifier le nombre de cases voulues
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameOutputCell.identifier, for: indexPath) as! GameOutputCell
        cell.configure(with: "Moi")
        return cell
    } // Afficher pour chaque case
}
 //Permet de personnaliser la taille des cells
/*extension ScoreController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
} */
