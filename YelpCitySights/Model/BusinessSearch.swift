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
    var display_phone: String?
    var distance: Double?
    var id: String?
    var image_url: String?
    var is_closed: Bool?
    var location: Location?
    var name, phone, price: String?
    var rating: Double?
    var review_count: Int?
    var url: String?
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
}

// MARK: - Region
struct Region: Decodable {
    var center: Coordinate?
}

