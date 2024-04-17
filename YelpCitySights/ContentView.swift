//
//  ContentView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear(perform: {
            print(Bundle.main.infoDictionary?["API_KEY"] as? String)
        })
    }
}

#Preview {
    ContentView()
}
