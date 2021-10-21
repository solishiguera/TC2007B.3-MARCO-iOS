//
//  News.swift
//  Marco
//
//  Created by Andres Piñones on 18/10/21.
//   let news = try? newJSONDecoder().decode(News.self, from: jsonData)

import Foundation

// MARK: - News
struct News: Decodable {
    let id, title, subtitle, date: String
    let description: String
    let photoUrl: String
}
