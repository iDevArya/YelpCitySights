//
//  BusinessModel.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/24/24.
//

import Foundation
@Observable
class BusinessModel {
    var query: String = ""
    var businesses = [Business]()
    var selectedBusiness: Business?
    var dataService = DataService()
    
    func getBusiness() {
        Task {
            businesses = await dataService.apirequest()
        }
    }
}
