//
//  CurrentLocation.swift
//  WeatherWear
//
//  Created by Phousanak Han on 29/06/20.
//  Copyright © 2020 Phousanak Han. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

class Location{
    class func CurrentLocation(){
        var locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        
        var CurLoc: CLLocation!
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            CurLoc = locationManager.location
        }
        
        let UserLocation = CurLoc
    }
}




