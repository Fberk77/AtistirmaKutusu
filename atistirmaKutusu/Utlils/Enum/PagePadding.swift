//
//  p.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 3.12.2025.
//

import Foundation

// Tüm sayfa içi boşluk (padding) değerlerini
// tek bir yerde toplamak için oluşturulan yapı.
struct PagePadding {
    
    // "All" adında bir enum oluşturuyoruz.
    // Bu enum tüm kenarlara verilecek padding değerlerini temsil ediyor.
    enum All: Double {
        
        // normalPadding = 16 → Uygulamada sık kullanılan standart boşluk miktarı.
        case normalPadding = 16
    }
    
    
    enum Horizontal: CGFloat {
         case normalHorizontal = 24 // normalHorizontal = 24 → Uygulamada sık kullanılan standart boşluk miktarı.
     }
}
