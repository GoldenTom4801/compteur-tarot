//
//  PlayerNameInput.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit

class PlayerNameInput: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var player_names: [String] = []
    
    static let identifier = "PlayerNameInput"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        player_names = get_players()
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PlayerNameInput", bundle: nil)
    }
    
    public func configure(with nb: Int) {
        label.text = "J\(nb)"
    }

}

extension PlayerNameInput: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return player_names.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return player_names[row]
    }
}
