//
//  Person.swift
//  StarTrivia
//
//  Created by Мой Господин on 24/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import Foundation

struct Person :Codable {
    let name: String
    let height: String
    let mass: String
    let hair: String
    let birthYear: String
    let gender: String
    let homeworldUrl: String
    let filmUrl: [String]
    let vehicleUrls: [String]
    let starshipUrls: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hair = "hair_color"
        case birthYear = "birth_year"
        case gender
        case homeworldUrl = "homeworld"
        case filmUrl = "films"
        case vehicleUrls = "vehicles"
        case starshipUrls = "starships"
    }
}
