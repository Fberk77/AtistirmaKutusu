//
//  FacebookButton.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 28.11.2025.
//

import SwiftUI


struct GoogleButton: View {
    var onTap: () -> Void
    var body: some View {
        Button {
            onTap()
        } label: {
            HStack{
                
                Image(IconItems.Social.google.rawValue)
                Text(LocalKeys.Auth.google.rawValue.local())
                    .foregroundColor(.black)
                Spacer()
            }
            .tint(.black)
            .font(.title2)
            .padding(.all,PagePadding.All.normalPadding.rawValue)
           
            
        }.buttonBorderShape(.roundedRectangle)
            .controlSize(.large)
            .background(Color.white)
            .cornerRadius(RadiusItems.radius)
    }
}

#Preview {
    GoogleButton(onTap: {}) // Safe area'yı yok sayar
        
}
