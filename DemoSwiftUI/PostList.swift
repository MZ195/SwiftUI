//
//  PostList.swift
//  FIrstBoy
//
//  Created by Mazen .A on 16/03/2020.
//  Copyright © 2020 Mazen .A. All rights reserved.
//

import SwiftUI

struct PostList: View {
    
    @ObservedObject var store = DataStore()
    
    var body: some View {
        List(store.posts) { post in
            VStack(alignment: .leading, spacing: 8) {
                Text(post.title)
                    .font(.system(.title, design: .serif))
                    .bold()
                
                Text(post.body)
                    .font(.subheadline).foregroundColor(.secondary)
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
