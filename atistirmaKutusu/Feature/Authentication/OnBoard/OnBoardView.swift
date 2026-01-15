//
//  OnBoardView.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 7.12.2025.
//

import SwiftUI

struct OnBoardView: View {
    
   private  func count() -> Int{
        OnBordeModel.items.count - 1
    }
    
    @State var currentIndex: Int = 0
    
    
    var body: some View {
        
        GeometryReader { geomtry in
            
            VStack { // dikeyde sıralar
                Spacer()
                TabView(selection: $currentIndex,
                content: {
                    ForEach((0...count()), id: \.self) {
                        
                        value in
                        SlenderCard(
                            imageHeight:
                                geomtry.heightProxy(height: 0.45),
                                model: OnBordeModel.items[value]
                        )
                        
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))

                
                
                Spacer()
                HStack {
                    ForEach((0...count()), id: \.self)  { index in
                        if index == currentIndex {
                            IndicatorRectangle(width:
                                                geomtry.widthProxy(width:0.05))
                        } else {
                            IndicatorRectangle(width:
                                                geomtry.widthProxy(width:0.02))
                        }
                    }
                }
                .frame(height: ViewSizeHeight.indicator)

                
                normalButton(onTap: {}, title: LocalKeys.OnBoardView.getStarted.rawValue)
                    .padding(.all, PagePadding.All.normalPadding.rawValue) // ekramım genel olarak yandan ne kadar boşluk olduğunu ayarladık
                
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
