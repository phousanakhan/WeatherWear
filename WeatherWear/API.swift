//
//  API.swift
//  WeatherWear
//
//  Created by Phousanak Han on 24/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

//Task:
//1.API KEY + URL ENDPOINT
import Foundation
import SwiftUI
private let baseUrlCurrentWeather = URL(string:"api.openweathermap.org/data/2.5/weather")!
private let appid = "4e11d98189a1f1911eeb04f7ce0d209f"
private let baseUrlWeeklyWeather = URL(string: "api.openweathermap.org/data/2.5/forecast/daily")!

private var decoder: JSONDecoder{
    let decode = JSONDecoder()
    decode.keyDecodingStrategy = .convertFromSnakeCase
    return decode
}

class API {
    class func fetchCurrentWeather(by city: String, onSuccess: @escaping (Weather) -> Void ){
        let query = ["q": "\(city)", "appid": appid, "units": "Imperial"]
        guard let url = baseUrlCurrentWeather.withQueries(queries: query)
            else{
                fatalError()
        }
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data, err == nil else {
                fatalError()
            }
            do {
                let weather = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    onSuccess(weather)
                }
            }
            catch {
                fatalError()
            }
        }.resume()
    }
}

extension URL {
    func withQueries( queries: [String: String]) -> URL? {
        guard var component = URLComponents(url: self, resolvingAgainstBaseURL: true)
            else{
                fatalError()
        }
        component.queryItems = queries.map{ URLQueryItem(name: $0.key, value: $0.value)}
        return component.url
    }
}
