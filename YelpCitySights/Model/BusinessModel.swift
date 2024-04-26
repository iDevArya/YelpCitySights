//
//  BusinessModel.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/24/24.
//

import Foundation
import CoreLocation

@Observable
class BusinessModel: NSObject, CLLocationManagerDelegate {
    var query: String = ""
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var dataService = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusiness() {
        Task {
            businesses = await dataService.apirequest(userLocation: currentUserLocation)
        }
    }
    
    func getLocation() {
        if locationManager.authorizationStatus == .authorizedWhenInUse {
            
            currentUserLocation = nil
            locationManager.requestLocation()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // Detect if user allowed, then request location
        
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentUserLocation == nil  {
            currentUserLocation = locations.last?.coordinate
            getBusiness()
        }
        manager.stopUpdatingLocation()
    }
    
    
}
