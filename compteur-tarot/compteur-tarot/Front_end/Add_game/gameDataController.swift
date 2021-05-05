//
//  gameDataController.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import UIKit

class gameDataController: UIViewController {

    @IBOutlet weak var petit_bout: UISegmentedControl!
    @IBOutlet weak var b_preneur: UIButton!
    @IBOutlet weak var b_appel: UIButton!
    @IBOutlet weak var b_points: UIButton!
    @IBOutlet weak var b_bouts: UIButton!
    
    var preneur: String = "" // A remplacer plus tard par une primary key
    var appel: String = ""
    var points: Int = 0
    var bouts: Int = 0
    var petit_au_bout: Bool = false
    var poignee: Int?
    var chelem: Bool = false

    var players: [String] = get_players()
        // Il faudrait décider quand est-ce qu'on update la base de donnée
        // Et donc qui charge les données et qui les reçoit en prepare
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func is_petit_au_bout(_ sender: Any) {
        switch petit_bout.selectedSegmentIndex {
        case 0:
            petit_au_bout = true
        case 1:
            petit_au_bout = false
        default:
            print("erreur")
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?)  {
        guard let vc = segue.destination as? player_choice else { return }
        guard let sender_tag = (sender as? UIButton)?.tag else {return }
        vc.delegate = self
        vc.tag = sender_tag
        switch sender_tag { // On a précédemment défini des tag dans le storyboard
        case 0, 1:
            vc.data = players
        case 2:
            vc.data = (0...91).map { String($0) }
        case 3:
            vc.data = ["0", "1", "2", "3"]
        default:
            print("erreur")
        }
    }
    

}

extension gameDataController: choix_du_joueur {
    func choix(nb: Int, tag: Int) {
        switch tag {
        case 0:
            preneur = players[nb]
            b_preneur.setTitle(preneur, for: .normal)
        case 1:
            appel = players[nb]
            b_appel.setTitle(appel, for: .normal)
        case 2:
            points = nb
            b_points.setTitle(String(points), for: .normal)
        case 3:
            bouts = nb
            b_bouts.setTitle(String(bouts), for: .normal)
        default:
            print("erreur")
        }
    }
}
