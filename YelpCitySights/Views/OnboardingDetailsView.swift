//
//  OnboardingDetailsView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/25/24.
//

import SwiftUI

struct OnboardingDetailsView: View {
    
    var bgColor: Color
    var headline: String
    var subHeadline: String
    var buttonAction: () -> Void
    var body: some View {
        ZStack {
            Color(bgColor)
            VStack(spacing: 0) {
                Spacer()
                Spacer()
                Image("onboarding")
                
                Text(headline)
                    .font(.system(size: 22))
                    .bold()
                    .padding(.top, 32)
                
                Text(subHeadline)
                    .padding(.horizontal)
                    .padding(.top, 4)
                Spacer()
                Button {
                    // TODO: -
                    buttonAction()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .frame(height: 50)
                            .padding()
                        Text("Continue")
                            .bold()
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 115)

            }
            .foregroundStyle(.white)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingDetailsView(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadline: "City Sights helps to find the best of the city!") {
        // Nothing 
    }
}
