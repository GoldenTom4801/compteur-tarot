//
//  type_declaration.swift
//  compteur-tarot
//
//  Created by Thomas Loux on 05/05/2021.
//

import Foundation

struct Joueur: Codable {
    var nom: String
    var key: Int
}

//Le String permet à Codable de savoir comment enregistrer les données (ici avec String et le nom déjà existant)
enum Poignee: String, Codable {
    case non
    case simple
    case double
    case triple
    
    static func to_poignee(nb: Int) -> Poignee {
        switch nb {
        case 0:
            return .non
        case 1:
            return .simple
        case 2:
            return .double
        case 3:
            return .triple
        default:
            return .non
        }
    }
}

struct Partie: Codable {
    var key: Int
    var nb_joueurs: Int
    var preneur: Joueur
    var appel: Joueur?
    var points: Int
    var bouts: Int
    var petit_au_bout: Bool
    var poignee: Poignee
    var chlemme: Bool
}

let invite = Joueur(nom: "Invité", key: 0)

