//
//  ViewController.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 04/05/2021.
//

import UIKit

class ViewController: UIViewController {
    var nb_players: Int = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func three_players(_ sender: Any) {
        nb_players = 3
        player_names()
    }
    @IBAction func four_players(_ sender: Any) {
        nb_players = 4
        player_names()
    }
    @IBAction func five_players(_ sender: Any) {
        nb_players = 5
        player_names()
    }
    @IBAction func six_players(_ sender: Any) {
        nb_players = 6
        player_names()
    }
    func player_names() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(identifier: "NameCollectionController") as NameCollectionController
        vc.nb_players = nb_players
        navigationController?.pushViewController(vc, animated: true)
        
    }

}

