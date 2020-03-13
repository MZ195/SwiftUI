//
//  Modifiers.swift
//  FIrstBoy
//
//  Created by Mazen .A on 12/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    func body(content: Content) -> some View {
//        var font:UIFont
        content
            .font(.system(.body, design: .rounded))
    }
}
