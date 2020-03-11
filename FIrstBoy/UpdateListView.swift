//
//  UpdateListView.swift
//  FIrstBoy
//
//  Created by Mazen .A on 11/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct UpdateListView: View {
    var body: some View {
        NavigationView {
            List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                NavigationLink(destination: Text("1")) {
                    Text("Swift UI")
                }
            }
        .navigationBarTitle(Text("Updates"))
        }
    }
}

struct UpdateListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateListView()
    }
}
