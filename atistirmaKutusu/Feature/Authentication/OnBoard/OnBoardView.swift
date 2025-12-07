//
//  OnBoardView.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 7.12.2025.
//

import SwiftUI

struct OnBoardView: View {
    var body: some View {
        VStack { // dikeyde sıralar
            Spacer()
            TabView(content: {
                VStack{
                    
                    Image("imgAlisveris")
                    Text("Shop global. Mind-blownly affordable.")
                }
                
                VStack{
                    
                    Image("imgAlisveris")
                    Text("Shop global. Mind-blownly affordable.")
                }
                
                VStack{
                    
                    Image("imgAlisveris")
                    Text("Shop global. Mind-blownly affordable.")
                }
                
            }).tabViewStyle(.page)
            
           
            Spacer()
            HStack{
            
                IndicatorRectangle(width:30)
                IndicatorRectangle(width:20)
                IndicatorRectangle(width:20)
            }.frame(height: 10)
            
            normalButton(onTap: {}, title: "Get Started")
                .padding(.all, PagePadding.All.normalPadding.rawValue) // ekramım genel olarak yandan ne kadar boşluk olduğunu ayarladık
              
        }
       
    }
}

struct IndicatorRectangle: View {
    var width: Double
    var body: some View {
        Rectangle().cornerRadius(RadiusItems.radius).frame(width: width)
    }
}


#Preview {
    OnBoardView()
}
