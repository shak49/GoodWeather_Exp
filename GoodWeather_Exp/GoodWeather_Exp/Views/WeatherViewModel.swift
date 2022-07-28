//
//  WeatherViewModel.swift
//  GoodWeather_Exp
//
//  Created by Shak Feizi on 7/28/22.
//

import Foundation


class WeatherViewModel: ObservableObject {
    private var service: WeatherAPIService?
    
    @Published var weather = Weather()
    
    var cityName: String? = ""
    var tempreture: String? {
        if let temp = weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    init() {
        self.service = WeatherAPIService()
    }
    
    func search() {
        if let city = cityName?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)  {
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        self.service?.getWeather(city: city, completion: { weather in
            if let weather = weather {
                self.weather = weather
            }
        })
    }
}
