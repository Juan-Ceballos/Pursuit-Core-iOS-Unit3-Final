//
//  Element.swift
//  Elements
//
//  Created by Juan Ceballos on 12/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Element: Codable {
    let name: String
    let atomicMass: Double
    let boil: Double?
    let discoveredBy: String?
    let melt: Double?
    let number: Int
    let symbol: String
    var urlNumberElement: String    {
        
    }
        
    enum CodingKeys: String, CodingKey {
        case name
        case atomicMass = "atomic_mass"
        case boil
        case discoveredBy = "discovered_by"
        case melt
        case number
        case symbol
    }
}

