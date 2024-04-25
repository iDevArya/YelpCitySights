//
//  YelpCitySightsApp.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import SwiftUI

@main
struct YelpCitySightsApp: App {
    @State var viewModel = BusinessModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(viewModel)
        }
    }
}
