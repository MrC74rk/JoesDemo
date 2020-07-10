//
//  ContentView.swift
//  JoesDemo
//
//  Created by Bryan Angelo on 7/7/20.
//  Copyright © 2020 Bryan Angelo. All rights reserved.
//

import SwiftUI



struct ContentView: View {
 
@State private var isActive = false
    var body: some View {
        NavigationView {
            Section {
                VStack {
                    Text("You're looking at the wrong view.")
                    Text("Preview the file:")
                    Text("PostList.swift")
                        .font(.title)
                        .bold()
                    NavigationLink(destination: PostList(), isActive: self.$isActive){
                        Text("")
                    }
                        
                    Button("Go to view") {
                        self.isActive = true
                    }
                    .font(.title)
                    .foregroundColor(.blue)
                    .background(Color.white)
                    .cornerRadius(40)
                    .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius:40)
                        .stroke(Color.blue, lineWidth: 5))
                    
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

