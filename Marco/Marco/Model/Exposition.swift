//
//  Exposition.swift
//  Marco
//
//  Created by Diego Solis on 10/7/21.
//

import Foundation


struct Exposition: Decodable{
    let id, title, startDate, description: String
    let cerraduria, museografia, salas, tecnica: String
    let obras: String
    let recorridoVirtual: String
    let videoUrl: String?
    let photoUrl: String
}
