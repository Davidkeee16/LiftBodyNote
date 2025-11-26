//
//  CatalogSection.swift
//  LiftBodyNote
//
//  Created by David Puksanskis on 25/11/2025.
//

import Foundation

// MARK: - CatalogSection

struct CatalogSection: Identifiable {
    let id = UUID()
    let muscleGroup: String
    let exercises: [Exercise]
}
