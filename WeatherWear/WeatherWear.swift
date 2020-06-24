//
//  WeatherWear.swift
//  WeatherWear
//
//  Created by Phousanak Han on 24/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let id, dt, cod, timezone: Int
    let name, base: String
    let coordinate: Coordinate
    let weather: [WeatherData]
    let main: Main
    let clouds: Clouds
    let sys: Sys
}

struct Coordinate: Codable {
    let longitude, latitude: Double
}

struct WeatherData: Codable, Identifiable {
    let id: Int
    let main, description, icon: String
}

struct Main: Codable {
    let temp, minTemp, maxTemp: Double
    let pressure, humidity: Double
}

struct Clouds: Codable {
    let cloud: String
}

struct Sys: Codable {
    let id, type, sunrise, sunset: Double
    let country: String
}
