//
//  Item.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 12/11/2025.
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
