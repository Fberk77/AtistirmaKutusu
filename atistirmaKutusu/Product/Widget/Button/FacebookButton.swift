//
//  FacebookButton.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 28.11.2025.
//

import SwiftUI

// FACEBOOK giriş butonu için custom bir SwiftUI View
struct facebookButton: View {
    
    // Dışarıdan gönderilen tıklama (onTap) işlemi
    var onTap: () -> Void
    
    var body: some View {
        Button {
            // Butona basıldığında çalışacak fonksiyon
            onTap()
        } label: {
            // Butonun iç tasarımı
            HStack {
                
                // Sol taraftaki Facebook icon'u
                Image(IconItems.Social.facebook.rawValue)
                
                // Localizable.strings içindeki facebook yazısını çeker
                Text(LocalKeys.Auth.facebook.rawValue.local())
                    
                Spacer()   // Yazıyı sola yaslamak için sağ tarafa boşluk bırakır
            }
            .tint(.white)  // Icon veya text varsa temas rengini beyaz yapar
            .font(.title2) // Yazı boyutu
            .padding(.all, PagePadding.All.normalPadding.rawValue) // İç boşluk
        }
        .buttonBorderShape(.roundedRectangle) // Butonun kenar formu
        .controlSize(.large)                  // Butonun genel boyutu
        .background(Color.deepskyBlue)        // Arka plan rengi
        .cornerRadius(RadiusItems.radius)     // Butonun köşe yumuşatma değeri
    }
}

#Preview {
    // Ekranda butonu önizlemek için
    facebookButton(onTap: {})
}
