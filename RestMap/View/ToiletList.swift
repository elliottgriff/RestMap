//
//  ToiletList.swift
//  RestMap
//
//  Created by Elliott Griffin on 11/11/24.
//

import SwiftUI

struct ToiletListView: View {
    @EnvironmentObject var toiletViewModel: ToiletViewModel
    
    var body: some View {
        NavigationView {
            List(toiletViewModel.toilets) { toilet in
                NavigationLink(destination: ToiletDetailView(toilet: toilet)) {
                    HStack {
                        Text(toilet.name)
                            .font(.headline)
                        Spacer()
                        Text("⭐️ \(toilet.averageRating, specifier: "%.1f")")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Toilets Nearby")
            .onAppear {
                toiletViewModel.fetchToilets()
            }
        }
    }
}

#Preview {
    ToiletListView()
        .environmentObject(ToiletViewModel())
}
