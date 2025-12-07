//
//  FacebookButton.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 28.11.2025.
//

import SwiftUI


struct EmailButton: View {
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack{
                Spacer()
                Image(IconItems.Social.email.rawValue)
                Text(LocalKeys.Auth.email.rawValue.local())
                  
                Spacer()
            }
            .tint(.Peach)
            .font(.system(size:FontSize.headline,weight:.semibold ))
            .padding(.all,PagePadding.All.normalPadding.rawValue)
           
            
        }.buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .background(Color.white)
            .cornerRadius(RadiusItems.radius)
    }
}

#Preview {
    EmailButton(onTap: {}) // Safe area'yı yok sayar
        
}

