//
//  ListViewModel.swift
//  TravelVista
//
//  Created by Jonathan PRNS on 05/11/2026.
//


import Foundation

// ViewModel de ListView : fournit les régions et leurs pays, chargés depuis Source.json
class ListViewModel {
    // Tableau des régions, rempli à l'aide de Service, comme le faisait ListViewController
    let regions: [Region] = Service().load("Source.json")
}
