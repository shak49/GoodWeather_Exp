//
//  NetworkService.swift
//  GoodWeather_Exp
//
//  Created by Shak Feizi on 7/28/22.
//

import UIKit


class WeatherAPIService {
    //https://api.openweathermap.org/data/2.5/weather?appid=a0daaf29293c8c70eceb28ebc8a6520d&q=London
    
    func getWeather(city: String, completion: @escaping(Weather?) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=a0daaf29293c8c70eceb28ebc8a6520d") else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let response = try? JSONDecoder().decode(Response.self, from: data)
            if let response = response {
                let weather = response.main
                print(weather)
                completion(weather)
            } else {
                completion(nil)
            }
        }
        .resume()
    }
}
