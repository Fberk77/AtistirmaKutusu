//
//  OnBordeModel.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 11.12.2025.
//

import Foundation
struct OnBordeModel: Identifiable{
    var id: UUID = UUID()
    let İmageName: String
    let description: String
    
    static let items: [OnBordeModel] = [
        OnBordeModel(İmageName: "imgSecim", description: "Hand-pickle high quality snacks."),
        OnBordeModel(İmageName: "imgAlisveris", description: "Shop global. Mind-blownly affordable."),
        OnBordeModel(İmageName: "İmgTeslimat", description: "Deliver on the promise of time."),
   ]

}
