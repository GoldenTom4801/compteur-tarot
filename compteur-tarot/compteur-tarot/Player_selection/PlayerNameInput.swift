//
//  PlayerNameInput.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit

class PlayerNameInput: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    static let identifier = "PlayerNameInput"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .blue
        label.backgroundColor = .red
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PlayerNameInput", bundle: nil)
    }
    
    public func configure(with nb: Int) {
        label.text = "J\(nb)"

    }

}
