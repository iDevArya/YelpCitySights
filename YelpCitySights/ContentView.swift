//
//  ContentView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var query: String = ""
    @State var businesses = [Business]()
    var dataService = DataService()
    var body: some View {
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                Button {
                    // TODO: Implement query
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .padding(.vertical)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            
            List(businesses) { b in
                Text(b.name ?? "")
            }
            .padding()
            .task {
                businesses = await dataService.apirequest()
            }
        }
    }
}

#Preview {
    ContentView()
}
