//
//  ListView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/24/24.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessModel.self) var viewModel
    var body: some View {
        List {
            ForEach(viewModel.businesses) { b in
                VStack (spacing: 20) {
                    HStack (spacing: 0) {
                        if let imageUrl = b.imageURL {
                            AsyncImage(url: URL(string: imageUrl)) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                    .padding(.trailing, 16)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 50, height: 50)
                            }
                        } else {
                            Image("list-placeholder-image")
                                .padding(.trailing, 16)
                        }
                        
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
}

#Preview {
    ListView()
        .environment(BusinessModel())
}
