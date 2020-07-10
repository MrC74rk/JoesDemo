//
//  Data.swift
//  JoesDemo
//
//  Created by Bryan Angelo on 7/8/20.
//  Copyright © 2020 Bryan Angelo. All rights reserved.
//

import SwiftUI

struct Post: Codable, Identifiable {
    
    let id = UUID()
    var title: String
    var body: String
}

class Api {
    func getPosts(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
            else {
                fatalError("Invalad URL")
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
    .resume()
    }
}
