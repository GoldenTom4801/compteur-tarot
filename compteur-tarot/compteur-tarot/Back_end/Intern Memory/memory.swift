//
//  memory.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import Foundation

let EXTENSION_PARTIES = "data_parties.json"
let EXTENSION_JOUEURS = "data_joueurs.json"

func get_players() -> [String] { // Permettra dans le futur de charger les données
    let players = ["Thomas", "Martin", "Robin"]
    return players
}

struct data {
    var donneeParties: [Partie]
    var joueurs: [Joueur]

    init() {
        donneeParties = []
        joueurs = []
        read()
    }
    

    
    mutating func update_parties(partie: Partie) {
        donneeParties.append(partie)
    }
    mutating func update_joueurs(joueur: Joueur) {
        joueurs.append(joueur)
    }

    func save_parties() {
        let filename = getDocumentsDirectory().appendingPathComponent(EXTENSION_PARTIES)
        
        do {
            let data = try JSONEncoder().encode(donneeParties)
            try data.write(to: filename)
        } catch {
            print("erreur enregistrement")
        }
    }
    
    func save_joueurs() {
        let filename = getDocumentsDirectory().appendingPathComponent(EXTENSION_JOUEURS)
        
        do {
            let data = try JSONEncoder().encode(joueurs)
            try data.write(to: filename)
        } catch {
            print("erreur enregistrement")
        }
    }
    
    mutating func read() { // Est lancé à l'ouverture de l'application
        let filename_parties = getDocumentsDirectory().appendingPathComponent(EXTENSION_PARTIES)
        let filename_joueurs = getDocumentsDirectory().appendingPathComponent(EXTENSION_JOUEURS)
        
        
        var data_parties:String
        var data_joueurs:String
        do {
            try data_parties = String(contentsOf: filename_parties)
            try data_joueurs = String(contentsOf: filename_joueurs)
            let donneePartiesRead = try JSONDecoder().decode([Partie].self, from: data_parties.data(using: .utf8)!)
            let donneeJoueursRead = try JSONDecoder().decode([Joueur].self, from: data_joueurs.data(using: .utf8)!)
            donneeParties = donneePartiesRead
            joueurs = donneeJoueursRead
        } catch {
            print("erreur durant la lecture")
        }
    
    }

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
