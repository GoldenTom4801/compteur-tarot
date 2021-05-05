//
//  PlayerSelectionController.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 04/05/2021.
//

import UIKit

class PlayerSelectionController: UIViewController {

    var nb_players: Int = 4
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc  = segue.destination as? ScoreController {
            //vc?.nb_players =
        }
    }
    
    @IBOutlet weak var joueur1: UITextField!
    
    @IBAction func playerNames(_ sender: Any) {
        
    }
}
