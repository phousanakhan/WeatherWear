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
import CoreLocation

final class CurrentWeatherViewModel: ObservableObject {
    @Published var current: Weather?
    @ObservedObject var locationManager = LocationManager()

    
    init() {
    var locationManager1 = CLLocationManager()
    locationManager1.requestWhenInUseAuthorization()
    var CurLoc: CLLocation!
    if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse){
        CurLoc = locationManager1.location
    }
        let long = CurLoc.coordinate.longitude
        let lat = CurLoc.coordinate.latitude
        print(long)
        print(lat)

        
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: long)
        geoCoder.reverseGeocodeLocation(location,
                 completionHandler: { (placemarks, error) -> Void in
                    if error != nil {
                        fatalError()
                    }
                    
                    let pm = placemarks! as [CLPlacemark]
                    if (placemarks?.count)! > 0 {
                        let pm = placemarks![0]
                        //print(pm.locality!)
                        self.fetch(city: pm.locality!)
                    }
                    else{
                        fatalError()
                    }
            } )
        self.fetch()
    }
}

extension CurrentWeatherViewModel {
    
    
    func fetch( city: String = "london"){
        
        API.fetchCurrentWeather(by: city) {
            self.current = $0
        }
    }
}
    


