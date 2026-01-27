//
//  viewStatusHiddenModifier.swift
//  atistirmaKutusu
//
//  Created by tuğba berk on 24.01.2026.
//

import Foundation
import SwiftUI

struct viewStatusHiddenModifier: ViewModifier {
    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *) {
            content.toolbar(.hidden,for: .automatic)
        }else{
            content.navigationBarHidden(true)
        }
    }
}
