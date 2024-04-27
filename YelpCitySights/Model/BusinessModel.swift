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
    
    var businesses = [Business]()
    var selectedBusiness: Business?
    
    var dataService = DataService()
    var locationManager = CLLocationManager()
    var currentUserLocation: CLLocationCoordinate2D?
    var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.delegate = self
    }
    
    func getBusiness(query: String?, options: String?, category: String?) {
        Task {
            
            businesses = await dataService.apirequest(userLocation: currentUserLocation, query: query, options: options, category: category)
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
        authorizationStatus = manager.authorizationStatus
        if manager.authorizationStatus == .authorizedWhenInUse {
            currentUserLocation = nil
            manager.requestLocation()
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentUserLocation == nil  {
            currentUserLocation = locations.last?.coordinate
            getBusiness(query: nil, options: nil, category: nil)
        }
        manager.stopUpdatingLocation()
    }
    
    
}
