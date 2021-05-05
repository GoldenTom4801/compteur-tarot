//
//  player_choice.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit

class player_choice: UIViewController {

    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var delegate: choix_du_joueur?
    var data: [String] = []
    var tag: Int = -1 // Permet de savoir qui a appelé le sélecteur
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
}
    extension player_choice: UIPickerViewDelegate, UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return data.count
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return data[row]
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if let head = delegate {
                head.choix(nb: row, tag: tag)
            }
            self.dismiss(animated: true, completion: nil)
        }
        
}

protocol choix_du_joueur {
    func choix(nb: Int, tag: Int) 
}
