//
//  normalButton.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 7.12.2025.
//

import Foundation

import SwiftUI


struct normalButton: View {
    

    var onTap: () -> Void
    var title: String
    var body: some View {
        Button {
          
            onTap()
        } label: {
         
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
            .tint(.white)
            .font(.title2)
            .padding(.all, PagePadding.All.normalPadding.rawValue)
        }
        .buttonBorderShape(.roundedRectangle)
        .controlSize(.large)
        .background(Color.peace2)
        .cornerRadius(RadiusItems.radius)
    }
}

#Preview {
  
    normalButton(onTap: {}, title: "Simple")
}
