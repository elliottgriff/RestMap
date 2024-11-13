//
//  Review.swift
//  RestMap
//
//  Created by Elliott Griffin on 10/19/24.
//

import FirebaseFirestore
import CoreLocation

struct Review: Identifiable, Codable {
    @DocumentID var id: String?
    var userId: String
    var toiletId: String
    var rating: Double
    var reviewText: String
    var date: Date
}
