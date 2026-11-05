//
//  ListView.swift
//  TravelVista
//
//  Created by Jonathan PRNS on 05/11/2026.
//

import SwiftUI

// Écran principal : liste des pays classés par région
struct ListView: View {
    // Données fausses et fixes pour tester l'affichage (les vraies données viendront plus tard)
    let regions = ["Europe", "Asie", "Oceanie", "Afrique", "Ameriques"]

    var body: some View {
        NavigationStack {
            List {
                // Une section par région
                ForEach(regions, id: \.self) { region in
                    Section(header: Text(region)) {
                        // Deux cellules factices par section
                        CountryCellView()
                        CountryCellView()
                    }
                }
            }
            .navigationTitle("Liste de voyages")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ListView()
}
