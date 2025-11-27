//
//  CatalogSection.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 25/11/2025.
//

import Foundation

// MARK: - MuscleGroupItem

struct MuscleGroupItem: Identifiable {
    let id = UUID()
    let name: String
    let exerciseCount: Int
}
