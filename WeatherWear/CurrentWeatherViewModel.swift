//
//  CurrentWeatherViewModel.swift
//  WeatherWear
//
//  Created by Phousanak Han on 25/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI
import Combine
import UIKit
import MapKit

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    
    init() {
    /*var locationManager = CLLocationManager()
    locationManager.requestWhenInUseAuthorization()
    var CurLoc: CLLocation!
    if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
        CLLocationManager.authorizationStatus() ==  .authorizedAlways){
        CurLoc = locationManager.location
    }
        let long = CurLoc.coordinate.longitude
        let lat = CurLoc.coordinate.latitude
        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: long)
        geoCoder.reverseGeocodeLocation(location, completionHandler: {
            placemarks, error -> Void in
            
            guard let placeMark = placemarks?.first else {return}
            if let locationName = placeMark.location {
                print(locationName)
            }
        } )*/
        
        
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
    


