//
//  DynamicSizeGeometry.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 7.12.2025.
//


import SwiftUI
extension GeometryProxy {
    func heightProxy(height: Double) -> Double{
        return size.height * height
    }
    
    func widthProxy(width: Double) -> Double{
        return size.height * width
    }
}
