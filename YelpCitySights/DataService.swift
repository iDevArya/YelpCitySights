//
//  DataService.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import Foundation

struct DataService {
    
    
    func apirequest() async -> [Business] {
        guard let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String else {
            return [Business]()
        }
        // Create an URL
        if let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=37.785834&longitude=-122.406417&categories=restaurants&limit=10") {
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
