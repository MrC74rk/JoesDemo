//
//  Post.swift
//  JoesDemo
//
//  Created by Bryan Angelo on 7/7/20.
//  Copyright © 2020 Bryan Angelo. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    
        
        var city_name: String = ""
        var wind_spd: String = ""
        var wind_cdir: String = ""
        var temp: String = ""
        var app_temp: String = ""
        var uv: String = ""
        
        private enum WeatherResponseKeys: String, CodingKey {
            case data
        }
        
        private enum MainKeys: String, CodingKey {
            case city_name
            case wind_spd
            case wind_cdir
            case temp
            case app_temp
            case uv
        }


    init(from decoder: Decoder) throws {
        
            if let weatherResponseContainer = try? decoder.container(keyedBy: WeatherResponseKeys.self) {
                if let mainContainer = try? weatherResponseContainer.nestedContainer(keyedBy: MainKeys.self, forKey:
                    .data) {
                    
                    self.city_name = try mainContainer.decode(String.self, forKey: .city_name)
                    self.wind_spd = try mainContainer.decode(String.self, forKey: .wind_spd)
                    self.wind_cdir = try mainContainer.decode(String.self, forKey: .wind_cdir)
                    self.temp = try mainContainer.decode(String.self, forKey: .temp)
                    self.app_temp = try mainContainer.decode(String.self, forKey: .app_temp)
                    self.uv = try mainContainer.decode(String.self, forKey: .uv)
                }
        
            }
        }
}

class getAPIData {
    let APIKey = "7b08820dde694f129ef230ae09b53f1b"
    let postal_code = "77449"
    let country = "US"
    let link = "https://api.weatherbit.io/v2.0/current"


   func getPosts() {
        guard let url = URL(string: "\(link)?&UNITS=I&postal_code=\(postal_code)&country=\(country)&KEY=\(APIKey)")
            else {
                fatalError("Incorrect URL")
            }


        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
             
                let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
                if let weatherResponse = weatherResponse {
                    print(weatherResponse)
                }
            }
        }.resume()
    }
}
