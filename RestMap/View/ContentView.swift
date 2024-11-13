//
//  ContentView.swift
//  RestMap
//
//  Created by Elliott Griffin on 3/23/24.
//

import SwiftUI
import Foundation
import MapKit

struct ContentView: View {
    @EnvironmentObject var toiletViewModel: ToiletViewModel
    @EnvironmentObject var session: SessionStore
    @State var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    var body: some View {
        Group {
            if session.currentUser == nil {
                LandingView()
            } else {
                NavigationView {
                    VStack {
                        NavigationLink("Map") {
                            MapView(region: $region, toilets: toiletViewModel.toilets)
                        }
                        NavigationLink("My Toilets") {
                            ToiletListView()
                                .environmentObject(toiletViewModel)
                        }
                    }
                    .navigationTitle("RestMap")
                }
            }
        }
        .onAppear {
            session.listen()
        }
    }
}
#Preview {
    ContentView()
}
