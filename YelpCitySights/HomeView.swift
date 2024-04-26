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
    @State var query = ""
    @FocusState var textfieldFocused: Bool
    @State var isPopularOn = false
    @State var showOptions = false
    @State var isDealOn = false
    @State var categotySelection = "restaurants"
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($textfieldFocused)
                    .onTapGesture {
                        withAnimation {
                            showOptions = true
                        }
                    }
                Button {
                    withAnimation {
                        showOptions = false
                        textfieldFocused = false
                    }
                    
                    // Perform a search
                    viewModel.getBusiness(query: query,
                                          options: getOptionsString(),
                                          category: categotySelection)
                    
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 32)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
            .padding(.horizontal)
            if showOptions {
                VStack {
                    Toggle("Popular", isOn: $isPopularOn)
                    Toggle("Deal", isOn: $isDealOn)
                    
                    HStack {
                        Text("Categoty")
                        Spacer()
                        Picker("Category", selection: $categotySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                    
                }
                .padding(.horizontal, 40)
                .transition(.scale)
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
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            textfieldFocused = false
                        }
                    }
                
            } else {
                MapView()
                    .onTapGesture {
                        withAnimation {
                            showOptions = false
                            textfieldFocused = false
                        }
                    }
            }
            
            
            
        }
        .onAppear(perform: {
            viewModel.getBusiness(query: nil, options: nil, category: nil)
        })
        .sheet(item: $viewModel.selectedBusiness) { item in
            BusinessDetialView()
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if isPopularOn {
            optionsArray.append("hot_and_new")
        }
        if isDealOn {
            optionsArray.append("deals")
        }
        
        return optionsArray.joined(separator: ",")
    }
}


#Preview {
    HomeView()
        .environment(BusinessModel())
}
