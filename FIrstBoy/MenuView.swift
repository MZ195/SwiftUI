//
//  MenuView.swift
//  FIrstBoy
//
//  Created by Mazen .A on 04/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            MenuRow()
            
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuRow: View {
    var body: some View {
        HStack(spacing : 16) {
            
            Image(systemName: "gear")
                .font(.system(size: 20, weight: .light))
                .imageScale(.medium)
            Text("Account")
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
    }
}
