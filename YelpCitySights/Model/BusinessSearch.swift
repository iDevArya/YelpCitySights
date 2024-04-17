//
//  BusinessSearch.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/17/24.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var region = Region()
    var total = 0
}

// MARK: - Business
struct Business: Decodable, Identifiable {
    var alias: String?
    var categories: [Category]
    var coordinates: Coordinate?
    var displayPhone: String?
    var distance: Double?
    var id: String?
    var imageURL: String?
    var isClosed: Bool?
    var location: Location?
    var name, phone, price: String?
    var rating: Double?
    var reviewCount: Int?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case alias, categories, coordinates
        case displayPhone = "display_phone"
        case distance, id
        case imageURL = "image_url"
        case isClosed = "is_closed"
        case location, name, phone, price, rating
        case reviewCount = "review_count"
        case url
    }
}

// MARK: - Category
struct Category: Decodable {
    var alias, title: String?
}

// MARK: - Center
struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}

// MARK: - Location
struct Location: Decodable {
    var address1, address2, address3, city: String?
    var country: String?
    var displayAddress: [String]?
    var state, zipCode: String?
    
    enum CodingKeys: String, CodingKey {
        case address1, address2, address3, city, country
        case displayAddress = "display_address"
        case state
        case zipCode = "zip_code"
    }
}

// MARK: - Region
struct Region: Decodable {
    var center: Coordinate?
}

