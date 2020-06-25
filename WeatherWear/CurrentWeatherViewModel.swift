//
//  CurrentWeatherViewModel.swift
//  WeatherWear
//
//  Created by Phousanak Han on 25/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI
import Combine

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
    self.fetch()
    }
}

extension CurrentWeatherViewModel {
    func fetch( city: String = "edmonton"){
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
    


