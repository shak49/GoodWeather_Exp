//
//  ContentView.swift
//  GoodWeather_Exp
//
//  Created by Shak Feizi on 7/28/22.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject var model: WeatherViewModel
    
    init() {
        self.model = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter a city name...", text: self.$model.cityName) {
                self.model.search()
            }
            .font(.custom("Arial", size: 35))
            .padding()
            .fixedSize()
            Text(self.model.tempreture)
                .font(.custom("Arial", size: 100))
                .foregroundColor(.white)
                //.offset(y: 100)
                .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
