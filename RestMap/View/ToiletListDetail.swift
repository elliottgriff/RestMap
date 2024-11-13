//
//  ToiletListDetail.swift
//  RestMap
//
//  Created by Elliott Griffin on 11/11/24.
//

import SwiftUI

struct ToiletDetailView: View {
    var toilet: Toilet
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(toilet.name)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Average Rating: ⭐️ \(toilet.averageRating, specifier: "%.1f")")
                .font(.title2)
            
            Text("Reviews: \(toilet.reviewCount)")
                .font(.subheadline)
            
            Toggle(isOn: .constant(toilet.requiresPurchase)) {
                Text("Requires Purchase")
            }
            .disabled(true)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Toilet Details")
    }
}
