//
//  ContentView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/16/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(BusinessModel.self) var viewModel

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
            
            List {
                ForEach(viewModel.businesses) { b in
                    VStack (spacing: 20) {
                        HStack (spacing: 0) {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                            VStack (alignment: .leading) {
                                Text(b.name ?? "Restaurant")
                                    .font(Font.system(size: 15))
                                    .bold()
                                Text(TextHelper.distanceInMiles(meters: b.distance ?? 0))
                                    .font(Font.system(size: 16))
                                    .foregroundStyle(Color(red: 67/255, green: 71/255, blue: 76/255))
                            }
                            Spacer()
                            Image("regular_\(ceil(b.rating ?? 0))")
                        }
                        Divider()
                    }
                    .onTapGesture {
                        viewModel.selectedBusiness = b
                    }                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
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
    ContentView()
}
