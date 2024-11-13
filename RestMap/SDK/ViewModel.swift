//
//  ViewModel.swift
//  RestMap
//
//  Created by Elliott Griffin on 10/19/24.
//

import FirebaseFirestore
import SwiftUI

class ToiletViewModel: ObservableObject {
    @Published var toilets = [Toilet]()
    private var db = Firestore.firestore()

    func fetchToilets() {
        db.collection("toilets").addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error fetching toilets: \(error.localizedDescription)")
                return
            }

            self.toilets = querySnapshot?.documents.compactMap { document in
                let data = document.data()
                return Toilet(
                    id: document.documentID,
                    name: data["name"] as? String ?? "",
                    coordinate: data["coordinate"] as? GeoPoint ?? GeoPoint(latitude: 0, longitude: 0),
                    requiresPurchase: data["requiresPurchase"] as? Bool ?? false,
                    averageRating: data["averageRating"] as? Double ?? 0.0,
                    reviewCount: data["reviewCount"] as? Int ?? 0
                )
            } ?? []
        }
    }
}
