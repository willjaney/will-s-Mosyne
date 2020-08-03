//
//  DataStore.swift
//  Future
//
//  Created by Will Janey on 4/3/20.
//  Copyright © 2020 Will Janey. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
