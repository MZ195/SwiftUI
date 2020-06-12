//
//  UpdateStore.swift
//  FIrstBoy
//
//  Created by Mazen .A on 12/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}
