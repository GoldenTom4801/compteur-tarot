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
    @IBOutlet weak var b_chelem: UISegmentedControl!
    @IBOutlet weak var stackAppel: UIStackView!
    @IBOutlet weak var b_poignee: UIButton!
    
    var players: [Joueur] = [] // Initialiser lors de l'appel de prepare
    
    var partie = Partie(key: -1, nb_joueurs: 0, preneur: invite, appel: invite, points: 0, bouts: 0, petit_au_bout: false, poignee: .non, chlemme: false)


    
    override func viewDidLoad() {
        super.viewDidLoad()
        partie.nb_joueurs = players.count
        if partie.nb_joueurs < 5 { //Enleve s'il n'y a pas d'appel
            stackAppel.delete(nil)
        }
    }
    
    @IBAction func is_petit_au_bout(_ sender: Any) {
        switch petit_bout.selectedSegmentIndex {
        case 0:
            partie.petit_au_bout = true
        case 1:
            partie.petit_au_bout = false
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
            vc.data = players.map {$0.nom}
        case 2:
            vc.data = (0...91).map { String($0) }
        case 3:
            vc.data = ["0", "1", "2", "3"]
        case 4:
            vc.data = [Poignee.non.rawValue,Poignee.simple.rawValue,Poignee.double.rawValue,Poignee.triple.rawValue]
        default:
            print("erreur")
        }
    }
    

}

extension gameDataController: choix_du_joueur {
    func choix(nb: Int, tag: Int) {
        switch tag {
        case 0:
            partie.preneur = players[nb]
            b_preneur.setTitle(partie.preneur.nom, for: .normal)
        case 1:
            partie.appel = players[nb]
            b_appel.setTitle(partie.appel!.nom, for: .normal)
        case 2:
            partie.points = nb
            b_points.setTitle(String(partie.points), for: .normal)
        case 3:
            partie.bouts = nb
            b_bouts.setTitle(String(partie.bouts), for: .normal)
        case 4:
            partie.poignee = Poignee.to_poignee(nb: nb)
            b_poignee.setTitle(partie.poignee.rawValue, for: .normal)
            
        default:
            print("erreur")
        }
    }
}
