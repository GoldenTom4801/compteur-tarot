//
//  ContentView.swift
//  tarot
//
//  Created by Thomas Loux on 04/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ContentStoryboard()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
    
    
}

struct ContentStoryboard: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(withIdentifier : "Home")
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}
