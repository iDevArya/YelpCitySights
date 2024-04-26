//
//  OnboardingView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/25/24.
//

import SwiftUI

struct OnboardingView: View {
    @Environment(BusinessModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        ZStack {
            if selectedViewIndex == 0 {
                Color(red: 111/255, green: 154/255, blue: 189/255)
            } else {
                Color(red: 139/255, green: 166/255, blue: 65/255)
            }
            TabView(selection: $selectedViewIndex) {
                OnboardingDetailsView(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadline: "City Sights helps to find the best of the city!") {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                }
                .tag(0)
                
                OnboardingDetailsView(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255), headline: "Discover your City", subHeadline: "We'll show you the best restaurants, venues and more based on your location.") {
                    viewModel.getLocation()
                    dismiss()
                }
                .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            VStack {
                Spacer()
                HStack(spacing: 16) {
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .gray : .white)
                    Spacer()
                }
                .padding(.bottom, 220)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView()
}
