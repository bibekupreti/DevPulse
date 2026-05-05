//
//  Item.swift
//  DevPulse
//
//  Created by Bibek upreti on 05/05/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
