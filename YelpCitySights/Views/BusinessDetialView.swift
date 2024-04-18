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
        VStack {
            Image("detail-placeholder-image")
            Text(business?.name ?? "")
                .background(Color(.green))
                .foregroundColor(.white)
                .frame(width: 400, height: 20)
        }
    }
}

#Preview {
    BusinessDetialView()
}
