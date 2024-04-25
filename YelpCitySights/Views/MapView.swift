//
//  MapView.swift
//  YelpCitySights
//
//  Created by Shiva kumar Arya on 4/24/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @Environment(BusinessModel.self) var viewModel
    @State var selectedBusinessId: String?
    var body: some View {
        Map (selection: $selectedBusinessId){
            ForEach(viewModel.businesses, id: \.id) { b in
                Marker(b.name ?? "", coordinate: CLLocationCoordinate2D(latitude: b.coordinates?.latitude ?? 0, longitude: b.coordinates?.longitude ?? 0))
                    .tag(b.id ?? "None")
            }
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            // Find the business which matches the id
            let business = viewModel.businesses.first { business in
                business.id == selectedBusinessId
            }
            
            // If the business match is found, set it as the selected one
            if business != nil {
                viewModel.selectedBusiness = business!
            }
        }
    }
}

#Preview {
    MapView()
}
