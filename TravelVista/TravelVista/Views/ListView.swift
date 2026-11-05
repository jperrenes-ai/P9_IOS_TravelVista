//
//  ListView.swift
//  TravelVista
//

import SwiftUI

// Écran principal : liste des pays classés par région
struct ListView: View {
    // ViewModel qui fournit les régions et leurs pays
    let viewModel = ListViewModel()

    var body: some View {
        NavigationStack {
            List {
                // Une section par région
                ForEach(viewModel.regions, id: \.name) { region in
                    Section(header: Text(region.name)) {
                        // Une cellule par pays de la région, cliquable vers sa page de détail
                        ForEach(region.countries, id: \.name) { country in
                            NavigationLink(destination: DetailView(country: country)
                                .navigationTitle(country.name)
                                .navigationBarTitleDisplayMode(.inline)) {
                                CountryCellView(country: country)
                            }
                        }
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
