//
//  ContentView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var dataService = DataService()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await dataService.apirequest()
        }
    }
}

#Preview {
    ContentView()
}
