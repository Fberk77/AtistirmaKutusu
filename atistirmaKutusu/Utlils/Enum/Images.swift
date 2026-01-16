//
//  Images.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 27.11.2025.
//

import Foundation
import SwiftUI
enum Images: String {
    case atıstırma = "atıstırma"
}

struct ImagesItems {
    
    enum Authentication : String{
        case login = "login"

    }
    
}

extension String {
    func image() -> Image{
        return Image(self)
    }
}
