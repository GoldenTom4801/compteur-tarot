//
//  personnal_score.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit

class personnal_score: UIViewController {

    @IBOutlet weak var player_choice: UILabel!
    var players: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        players = get_players()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? player_choice {
            vc.delegate = self
            vc.data = players
        }
    }

}

extension personnal_score: choix_du_joueur {
    func choix(nb: Int, tag: Int) {
        player_choice.text = "Vous avez choisi " + players[nb]
    }
}
