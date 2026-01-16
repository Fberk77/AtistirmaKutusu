//
//  LocalKeys.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 3.12.2025.
//

import SwiftUI

// Tüm localization anahtarlarını düzenli tutmak için oluşturulan yapı
struct LocalKeys {
    
    // Auth ekranına ait localization key’lerini tutan enum
    enum Auth: String {
        // Her case, Localizable.strings dosyasındaki bir anahtara karşılık gelir
        case facebook = "signInaFacebook"    
        case google = "signInaGoogle"
        case apple = "signInaApple"
        case email = "signInaWithEmail"
    }
    
    
    enum OnBoardView: String {
        // Her case, Localizable.strings dosyasındaki bir anahtara karşılık gelir
        case getStarted = "Get Started"
      
    }
    
    enum Login: String {
        case welcomeBack = "welcomeBack"
        case Createaccount = "createaccount"
        case TermsAndCondition = "termsAndCondition"
        
    }

    
    enum General: String {
        case EmailHint = "emailHint"
        case PasswordHint = "passwordHint"
      
    }
    

}



// String'e ekstra özellik ekliyoruz
extension String {
    
    // Bir string'i LocalizedStringKey tipine çevirir
    // Böylece Text("key") yerine Text("key".local()) kullanarak lokalizasyon yapılır
    func local() -> LocalizedStringKey {
        return LocalizedStringKey(self)
    }
}
