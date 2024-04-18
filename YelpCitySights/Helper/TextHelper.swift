//
//  TextHelper.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/18/24.
//

import Foundation

struct TextHelper {
    
    static func distanceInMiles(meters: Double) -> String {
        let miles = meters * 0.000621371
        return String(format: "%.1f", miles)
    }
}
