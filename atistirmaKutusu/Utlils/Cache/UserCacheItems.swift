//
//  UserCacheItems.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 19.01.2026.
//

import Foundation

enum UserCacheKeys: String {
    // UserDefaults içinde kullanılacak key’leri güvenli şekilde tanımlamak için enum
    
    case onboard = "onboard"
    // Kullanıcının onboarding ekranını görüp görmediğini tutan key
    
    static let dummyValue = "save_onboard"
    // onboarding’in tamamlandığını belirtmek için kullanılan örnek (anlamsız) değer
}

protocol UserCacheprotocol {
    // User cache işlemleri için bir sözleşme (contract) tanımlar
    
    func read(key: UserCacheKeys) -> String
    // Verilen key’e göre UserDefaults’tan veri okuma fonksiyonu
    
    func save(value: String, key: UserCacheKeys)
    // Verilen değeri belirtilen key ile UserDefaults’a kaydetme fonksiyonu
    
    func remove(key: UserCacheKeys)
    // Verilen key’e ait veriyi UserDefaults’tan silme fonksiyonu
}

extension UserCacheprotocol {
    // Bu protocol’e uyan her yapı için
    // default (hazır) fonksiyon implementasyonlarını içerir
    
    
    func read(key: UserCacheKeys) -> String {
        // UserDefaults’tan belirtilen key’e göre veri okur
        
        guard let value = UserDefaults.standard.value(forKey: key.rawValue) as? String else {
            // Eğer key yoksa veya değer String değilse
            
            return ""
            // Boş string döndürerek crash olmasını engeller
        }
        
        return value
        // Okunan değeri geri döner
    }
    
    
    func save(value: String, key: UserCacheKeys) {
        // Verilen String değeri UserDefaults’a kaydeder
        
        UserDefaults.standard.set(value, forKey: key.rawValue)
        // key.rawValue → enum içindeki String değeri
    }
    
    
    func remove(key: UserCacheKeys) {
        // Belirtilen key’e ait veriyi UserDefaults’tan siler
        
        UserDefaults.standard.removeObject(forKey: key.rawValue)
        // Key tamamen kaldırılır
    }
    
}

struct UserDefaultCach: UserCacheprotocol {
    // UserCacheprotocol’e uyan boş bir struct
    
    // Bu struct:
    // - read
    // - save
    // - remove
    // fonksiyonlarını otomatik olarak kazanır
}
