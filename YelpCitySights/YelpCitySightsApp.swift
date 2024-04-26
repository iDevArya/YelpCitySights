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
    @AppStorage("OnBoarding") var needsOnboarding = true
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(viewModel)
                .fullScreenCover(isPresented: $needsOnboarding) {
                    // on Dismiss
                    needsOnboarding = false
                    
                } content: {
                    OnboardingView()
                        .environment(viewModel)
                }

        }
    }
}
