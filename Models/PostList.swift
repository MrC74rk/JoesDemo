//
//  PostList.swift
//  JoesDemo
//
//  Created by Bryan Angelo on 7/8/20.
//  Copyright © 2020 Bryan Angelo. All rights reserved.
//

import SwiftUI

struct PostList: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                Webservice().getPosts()
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
