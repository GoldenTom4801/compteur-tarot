//
//  GameOutputCell.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 04/05/2021.
//

import UIKit

class GameOutputCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "GameOutputCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .red
    }
    
    public func configure(with text: String) {
        label.text = text
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "GameOutputCell", bundle: nil)
    }

}
