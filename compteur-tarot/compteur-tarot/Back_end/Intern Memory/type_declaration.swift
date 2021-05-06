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
}

struct Partie: Codable {
    var key: Int
    var nb_joueurs: Int
    var preneur: Joueur
    var appel: Joueur?
    var points: Int
    var petit_au_bout: Bool
    var poignee: Poignee
    var chlemme: Bool
}

