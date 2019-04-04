//
//  Filme.swift
//  StarTrivia
//
//  Created by Мой Господин on 04/04/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import Foundation

class Film: Codable {
    let title: String
    let episode_id: Int
    let director: String
    let producer: String
    let release_date: String
    let opening_crawl: String
}
