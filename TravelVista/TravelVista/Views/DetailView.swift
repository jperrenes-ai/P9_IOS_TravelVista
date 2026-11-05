//
//  DetailView.swift
//  TravelVista
//
//  Created by Jonathan PRNS on 05/11/2026.
//


import SwiftUI

// Pont entre SwiftUI et UIKit : permet d'afficher DetailViewController (UIKit) dans une vue SwiftUI
struct DetailView: UIViewControllerRepresentable {
    // Pays à afficher, reçu à la création de la structure
    let country: Country

    // Fonction 1 : crée le view controller UIKit à partir du storyboard
    func makeUIViewController(context: Context) -> DetailViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // instantiateViewController renvoie un UIViewController : on le convertit en DetailViewController
        guard let detailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            fatalError("Impossible de créer DetailViewController depuis le storyboard")
        }

        // On transmet le pays au view controller
        detailViewController.country = country
        return detailViewController
    }

    // Fonction 2 : obligatoire pour le protocole, mais vide car la vue est statique
    func updateUIViewController(_ viewController: DetailViewController, context: Context) {
    }
}
