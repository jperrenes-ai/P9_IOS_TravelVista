//
//  CountryCellView.swift
//  TravelVista
//
//  Created by Jonathan PRNS on 05/11/2026.
//

import SwiftUI

// Cellule de la liste des pays : image ronde, nom du pays, capitale et note
struct CountryCellView: View {
    var body: some View {
        HStack {
            // Photo du pays, ronde
            Image("vietnam")
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(Circle())

            // Nom du pays et capitale, l'un sous l'autre
            VStack(alignment: .leading) {
                Text("Toto")
                    .font(.system(size: 20))
                    .foregroundStyle(Color("CustomBlue"))
                Text("Lorem Ipsum")
                    .font(.system(size: 15))
            }

            Spacer()

            // Note suivie d'une étoile
            Text("5")
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
    CountryCellView()
}
