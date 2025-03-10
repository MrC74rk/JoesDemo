//
//  PostList.swift
//  JoesDemo
//
//  Created by Bryan Angelo on 7/8/20.
//  Copyright © 2020 Bryan Angelo. All rights reserved.
//

import SwiftUI

struct PostList: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        List(posts) { post in
            Text(post.title)
        }
        .navigationBarTitle("API Output")
        .onAppear {
            Api().getPosts { (posts) in
            self.posts = posts
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        PostList()
        }
    }
}
