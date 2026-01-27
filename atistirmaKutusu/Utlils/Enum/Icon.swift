//
//  logo.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 27.11.2025.
//

import Foundation
enum Icon: String {
    case App_logo = "icons8-snack-62-2"
}

struct IconItems{
    
    enum Social: String {
        case facebook = "facebook3"
        case google = "google"
        case apple = "apple"
        case email = "email"
    }
    
    enum IconAsset : String{
        case email = "ic_email"
        case lock = "ic_lock"
    }
    
    enum TabarIcon : String{
        case home = "ic_home"
        case edit = "ic_edit"
        case market = "ic_market"
        case person = "ic_person"
    }

}
