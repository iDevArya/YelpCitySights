//
//  DataService.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import Foundation
import CoreLocation

struct DataService {
    
    
    func apirequest(userLocation: CLLocationCoordinate2D?, query: String?, options: String?, category: String?) async -> [Business] {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            return [Business]()
        }
        // Default lat & long
        var lat = 35.665517
        var long = 139.770398
        
        // Update user location
        if let userLocation = userLocation {
            lat = userLocation.latitude
            long = userLocation.longitude
        }
        var endpointUrlString = "https://api.yelp.com/v3/businesses/search?latitude=\(lat)&longitude=\(long)&categories=restaurants&limit=10"
        
        // Add Query to endpoint
        if query != nil && query != "" {
            endpointUrlString.append("&term=\(query!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)")
        }
        // Add options to endpoint
        if options != nil && options != "" {
            endpointUrlString.append("&attributes=\(options!)")
        }
        // Add Category to the endpoint
        if let category = category {
            endpointUrlString.append("&category=\(category)")
        }
        
        // Create an URL
        if let url = URL(string: endpointUrlString) {
            // Create an URLRequest
            var request = URLRequest(url: url)
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "accept")
            
            // Create a URLSession
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                // Parse the JSON
                let decoder = JSONDecoder()
                let result = try decoder.decode(BusinessSearch.self, from: data)
                return result.businesses
           
            }
            catch {
                print("Couldn't create an URLSession: \(error)")
            }
            
        }
        return [Business]()
    }
}
