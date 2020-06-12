//
//  DataStore.swift
//  FIrstBoy
//
//  Created by Mazen .A on 16/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        API().getPosts { (posts) in
            self.posts = posts
        }
    }
}
