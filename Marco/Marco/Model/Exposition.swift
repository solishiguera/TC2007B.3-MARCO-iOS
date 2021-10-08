//
//  Exposition.swift
//  Marco
//
//  Created by Diego Solis on 10/7/21.
//

import Foundation

struct ExpositionRequest: Codable {
    let results: [Exposition]
}

struct Exposition: Codable {
    let id: String
    let title: String
    let startDate: String
    let description: String
    let cerraduria: String
    let museografia: String
    let salas: String
    let tecnica: String
    let obras: String
    let recorridoVirtual: String
    let videoUrl: String
}
