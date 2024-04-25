//
//  ContentView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(BusinessModel.self) var viewModel
    @State var selectedTab = 0

    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            HStack {
                TextField("What are you looking for?", text: $viewModel.query)
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
            Picker("", selection: $selectedTab) {
                Text("List")
                    .tag(0)
                Text("Map")
                    .tag(1)
            }
            .pickerStyle(.segmented)
            
            if selectedTab == 0 {
                ListView()
            } else {
                MapView()
            }
            
            
            
        }
        .onAppear(perform: {
            viewModel.getBusiness()
        })
        .sheet(item: $viewModel.selectedBusiness) { item in
            BusinessDetialView()
        }
    }
}


#Preview {
    HomeView()
        .environment(BusinessModel())
}
