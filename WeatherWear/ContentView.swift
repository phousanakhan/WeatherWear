//
//  ContentView.swift
//  WeatherWear
//
//  Created by Phousanak Han on 24/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weather = CurrentWeatherViewModel()
    
    var body: some View {
        VStack{
            Text("\(weather.current?.name ?? "Unknown")")
        }
    }
}
extension Double {
    var round: Int {
        return Int(self)
    }
}


