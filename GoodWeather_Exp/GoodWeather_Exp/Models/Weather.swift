//
//  Weather.swift
//  GoodWeather_Exp
//
//  Created by Shak Feizi on 7/28/22.
//

import UIKit


struct Response: Codable {
    let main: Weather
}

struct Weather: Codable {
    var temp: Double?
    var humidity: Double?
}
