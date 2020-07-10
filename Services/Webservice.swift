//
//  Webservice.swift
//  JoesDemo
//
//  Created by Bryan Angelo on 7/7/20.
//  Copyright © 2020 Bryan Angelo. All rights reserved.
//

import Foundation

class Webservice {
    
    let APIKey = "7b08820dde694f129ef230ae09b53f1b"
    let postal_code = "77449"
    let country = "US"
    let link = "https://api.weatherbit.io/v2.0/current"
    
    
       func getAllPosts(completion: @escaping (Post?) -> ()) {
        guard let url = URL(string: "\(link)?&postal_code=\(postal_code)&country=\(country)&KEY=\(APIKey)")
            else {
                fatalError("URL is not correct")
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
      
            let posts = try! JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(posts)
                }
            print(posts)
        }.resume()
        


    }
}

