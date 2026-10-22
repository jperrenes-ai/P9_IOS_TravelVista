//
//  TitleViewSwiftUI.swift
//  TravelVista
//

import SwiftUI

// Bandeau de titre de l'écran de détail : nom du pays, capitale et note en étoiles
struct TitleViewSwiftUI: View {
    let countryName: String
    let capitalName: String
    let rate: Int

    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading, spacing: 0) {
                Text(countryName)
                    .font(.system(size: 22, weight: .medium))
                    .foregroundStyle(Color("CustomBlue"))
                    .frame(height: 28)
                Text(capitalName)
                    .font(.system(size: 17))
                    .foregroundStyle(Color(white: 1 / 3))
                    .frame(height: 21)
            }
            .lineLimit(1)

            Spacer()

            HStack(spacing: 0) {
                ForEach(0..<rate, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 19, height: 19)
                }
            }
            .foregroundStyle(Color.accentColor)
        }
        .padding(.leading, 20)
        .padding(.trailing, 16)
        .frame(height: 65)
    }
}

#Preview {
    TitleViewSwiftUI(countryName: "Norvège", capitalName: "Oslo", rate: 4)
}
