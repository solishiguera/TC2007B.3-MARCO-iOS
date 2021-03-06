//
//  Event.swift
//  Marco
//
//  Created by Diego Solis on 10/13/21.
//

import Foundation

struct Event: Decodable {
    let id: String
    let events: [String]
    let date: String
}
