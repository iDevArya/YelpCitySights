//
//  BusinessDetialView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/18/24.
//

import SwiftUI

struct BusinessDetialView: View {
    
    var business: Business?
    var body: some View {
        VStack (spacing: 0){
            ZStack (alignment: .trailing){
                Image("detail-placeholder-image")
                    .resizable()
                VStack {
                    Spacer()
                    Image("yelp-attribution-image")
                        .frame(width: 72, height: 36)
                }
            }
            .frame(height: 165)
            if let isClosed = business?.isClosed {
                
                ZStack (alignment: .leading){
                    Rectangle()
                        .frame(height: 40)
                        .foregroundColor(isClosed ? .red : .green)
                    Text(isClosed ? "Closed" : "Open")
                        .foregroundStyle(.white)
                        .bold()
                        .padding(.horizontal)
                }
                .frame(height: 36)
            }
            
            ScrollView(showsIndicators: false) {
                VStack (alignment: .leading, spacing: 0) {
                    Text(business?.name ?? "")
                        .font(Font.system(size: 21))
                        .bold()
                        .padding(.bottom, 10)
                        .padding(.top, 16)
                    Text("\(business?.location?.address1 ?? ""), \(business?.location?.city ?? "")")
                    Text("\(business?.location?.state ?? ""), \(business?.location?.zipCode ?? ""), \(business?.location?.country ?? "")")
                        .padding(.bottom, 10)
                    
                    Image("regular_\(ceil(business?.rating ?? 0))")
                        .padding(.bottom, 16)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "phone")
                        Text("\(business?.phone ?? "")")
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .padding(.vertical, 12)
                    
                    Divider()
                    
                    HStack {
                        Image(systemName: "globe")
                        Text("\(business?.url ?? "")")
                            .lineLimit(1)
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.right")
                        }
                    }
                    .padding(.vertical, 12)

                    Divider()
                    
                    HStack {
                        Image(systemName: "bubble.left.and.bubble.right")
                        Text("\(business?.reviewCount ?? 0) reviews")
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.right")
                        }
                        
                    }
                    .padding(.vertical, 12)
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    BusinessDetialView()
}
