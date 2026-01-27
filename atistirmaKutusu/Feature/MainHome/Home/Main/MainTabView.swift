//
//  MainTabView.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 24.01.2026.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            ForEach(HomeTabItem.tabItems){
                item in
                
                item.page.tabItem {
                    Image(item.model.icon.rawValue)
                    Text(item.model.title.rawValue.local())
                    
                }
            }
        }.accentColor(.peace1)
    }
}

#Preview {
    MainTabView()
}
