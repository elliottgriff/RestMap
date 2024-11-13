//
//  LocalData.swift
//  RestMap
//
//  Created by Elliott Griffin on 3/23/24.
//

import Foundation
import SwiftData

@Model
class LocalData {
    
    var id: String
    var name: String
    
    init(name: String) {
        
        self.id = UUID().uuidString
        self.name = name
        
    }
    
}
