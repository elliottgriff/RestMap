//
//  Toilet.swift
//  RestMap
//
//  Created by Elliott Griffin on 10/19/24.
//

import FirebaseFirestore
import CoreLocation

struct Toilet: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var coordinate: GeoPoint
    var requiresPurchase: Bool
    var averageRating: Double
    var reviewCount: Int
}

