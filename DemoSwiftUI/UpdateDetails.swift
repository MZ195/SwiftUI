//
//  UpdateDetails.swift
//  FIrstBoy
//
//  Created by Mazen .A on 11/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct UpdateDetails: View {
    
    var update: Update = updateData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(contentMode: .fit)
                
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
    }
}

struct UpdateDetails_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetails()
    }
}
