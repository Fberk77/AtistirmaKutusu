//
//  TextFieldModifer.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 16.01.2026.
//

import Foundation
import SwiftUI

struct TextFieldModifer: ViewModifier {
    func body(content: Content) -> some View {
        content.padding()
                .overlay(RoundedRectangle(cornerRadius:10).stroke(lineWidth: 2))
                .foregroundStyle(Color.clooney)
    }
}
