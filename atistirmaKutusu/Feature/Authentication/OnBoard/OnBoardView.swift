//
//  OnBoardView.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 7.12.2025.
//

import SwiftUI

struct OnBoardView: View {
    
    @StateObject var onBoardViewModel = OnBoardViewModel()
    @StateObject var onBoardSayfaGecis = OnBoardSayfaGecis()
    var body: some View {
        
        NavigationView {
            GeometryReader { geomtry in
                
                VStack { // dikeyde sıralar
                    Spacer()
                    TabView(selection: $onBoardViewModel.currentIndex,
                            content: {
                        ForEach(OnBordeModel.items.indices, id: \.self) { index in
                            SlenderCard(
                                imageHeight: geomtry.heightProxy(height: 0.45),
                                model: OnBordeModel.items[index]
                            )
                        }
                    })
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    
                    
                    Spacer()
                    HStack {
                        ForEach(OnBordeModel.items.indices, id: \.self) { index in
                            if index == onBoardViewModel.currentIndex {
                                IndicatorRectangle(width: geomtry.widthProxy(width: 0.05))
                            } else {
                                IndicatorRectangle(width: geomtry.widthProxy(width: 0.02))
                            }
                        }
                    }
                    .frame(height: ViewSizeHeight.indicator)
                    
                    
                   
                    NavigationLink( isActive: $onBoardViewModel.isHomeRedirect){
                        WelcomeView()
                            .navigationBarHidden(true)
                            .ignoresSafeArea(.all)
                    }label: {
                        normalButton(onTap: {onBoardViewModel.saveUserloginAndRedirect()},
                                     title:LocalKeys.OnBoardView.getStarted.rawValue)
                            .padding(.all, PagePadding.All.normalPadding.rawValue) // ekramım genel olarak yandan ne kadar boşluk olduğunu ayarladık
                    }
                }
            }
        }
    }
}

private struct SlenderCard : View {
    var imageHeight: Double
    let model: OnBordeModel
    var body: some View {
        VStack{
            Image(model.İmageName).frame(height: imageHeight)
            Text(model.description)
                .font(.system(size:FontSize.largeTitle,weight:.semibold ))
                .frame(alignment: .center)
                .foregroundColor(Color.peace2)
        }
    }
}

struct IndicatorRectangle: View {
    var width: Double
    var body: some View {
        Rectangle()
            .fill(Color.clooney)
            .cornerRadius(RadiusItems.radius).frame(width: width)
          
    }
}


#Preview {
    OnBoardView()
        
}

