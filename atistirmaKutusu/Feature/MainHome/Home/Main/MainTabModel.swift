//
//  MainTabModel.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 27.01.2026.
//

import Foundation
import SwiftUI

// yünik olması için Identifiable yapıldı
struct HomeTabItem : Identifiable{
    let id = UUID()
    let page: AnyView
    let model: TabModel
    
    static let tabItems: [HomeTabItem] = [
        
        HomeTabItem(page: AnyView(HomeView()), model: TabModel(title: LocalKeys.Tabar.home, icon: IconItems.TabarIcon.home) ),
        
        HomeTabItem(page: AnyView(Account()), model: TabModel(title: LocalKeys.Tabar.account, icon: IconItems.TabarIcon.person) ),
        
        HomeTabItem(page: AnyView(Crete()), model: TabModel(title: LocalKeys.Tabar.crete, icon: IconItems.TabarIcon.edit) ),
        
        HomeTabItem(page: AnyView(Market()), model: TabModel(title: LocalKeys.Tabar.market, icon: IconItems.TabarIcon.market) ),
        
        HomeTabItem(page: AnyView(wishlist()), model: TabModel(title: LocalKeys.Tabar.wishlist, icon: IconItems.TabarIcon.home) )
        
    ]
        
        
    
}

struct TabModel
{
    let title: LocalKeys.Tabar
    let icon: IconItems.TabarIcon
}
