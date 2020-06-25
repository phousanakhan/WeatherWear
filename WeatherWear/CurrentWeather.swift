//
//  CurrentWeather.dwift.swift
//  WeatherWear
//
//  Created by Phousanak Han on 25/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI

struct CurrentWeather: View {
    var weather: Weather?
    var height: CGFloat = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Today")
            .font(.title)
            .foregroundColor(.white)
            .bold()
            HStack{
                Text("\(weather?.main.temp.round ?? 0)")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(.system(size: 65))
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
        }
    }
}
