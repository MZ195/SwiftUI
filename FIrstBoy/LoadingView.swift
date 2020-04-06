//
//  LoadingView.swift
//  FIrstBoy
//
//  Created by Mazen .A on 06/04/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            LottieView(fileName: "loading")
                .frame(width: 200, height: 200)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
