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
        VStack(alignment: .center, spacing: 40) {
            Text("\(weather?.name ?? "unknown")")
            .foregroundColor(.white)
            .fontWeight(Font.Weight.light)
            .font(.system(size: 30))
            HStack{
                Text("\(weather?.main.temp.round  ?? 0)" + "°")
                    .foregroundColor(.white)
                    .fontWeight(Font.Weight.light)
                    .font(.system(size: 90))
            }
            Text("\(weather?.weather.last?.description ?? "Unknown")")
                .foregroundColor(.white)
                .fontWeight(Font.Weight.light)
                .font(.system(size: 20))
            
        }.frame(width: height, height: height)
            .background(LinearGradient(gradient: Gradient(colors: [Color.secondary, Color.accentColor]), startPoint: .topLeading, endPoint: .bottomTrailing))

    }
}
