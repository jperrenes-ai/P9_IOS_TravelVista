//
//  ListView.swift
//  TravelVista
//

import SwiftUI

// Écran principal : liste des pays classés par région
struct ListView: View {
    // Données fausses et fixes pour tester l'affichage (les vraies données viendront plus tard)
    let regions = ["Europe", "Asie", "Oceanie", "Afrique", "Ameriques"]
    
    // Pays factice utilisé pour tester la navigation vers la page de détail
    let fakeCountry = Country(name: "Toto",
                              capital: "Lorem Ipsum",
                              description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              rate: 5,
                              pictureName: "vietnam",
                              coordinates: Coordinates(latitude: 21.0285, longitude: 105.8542))
    
    var body: some View {
        NavigationStack {
            List {
                // Une section par région
                ForEach(regions, id: \.self) { region in
                    Section(header: Text(region)) {
                        // Deux cellules factices par section, chacune cliquable vers le détail
                        NavigationLink(destination: DetailView(country: fakeCountry)
                            .navigationTitle(fakeCountry.name)
                            .navigationBarTitleDisplayMode(.inline)) {
                                CountryCellView()
                            }
                        NavigationLink(destination: DetailView(country: fakeCountry)
                            .navigationTitle(fakeCountry.name)
                            .navigationBarTitleDisplayMode(.inline)) {
                                CountryCellView()
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
