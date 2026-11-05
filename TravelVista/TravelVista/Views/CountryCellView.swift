//
//  CountryCellView.swift
//  TravelVista
//

import SwiftUI

// Cellule de la liste des pays : image ronde, nom du pays, capitale et note
struct CountryCellView: View {
    // Pays à afficher dans la cellule
    let country: Country

    var body: some View {
        HStack {
            // Photo du pays, ronde
            Image(country.pictureName)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(Circle())

            // Nom du pays et capitale, l'un sous l'autre
            VStack(alignment: .leading) {
                Text(country.name)
                    .font(.system(size: 20))
                    .foregroundStyle(Color("CustomBlue"))
                Text(country.capital)
                    .font(.system(size: 15))
            }

            Spacer()

            // Note suivie d'une étoile
            Text(String(country.rate))
                .font(.system(size: 17))
            Image(systemName: "star.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color("CustomSand"))
        }
    }
}

#Preview {
    CountryCellView(country: Country(name: "Norvège",
                                     capital: "Oslo",
                                     description: "",
                                     rate: 4,
                                     pictureName: "norvege",
                                     coordinates: Coordinates(latitude: 59.9139, longitude: 10.7522)))
}
