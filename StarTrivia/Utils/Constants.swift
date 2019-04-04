//
//  Constants.swift
//  StarTrivia
//
//  Created by Мой Господин on 24/03/2019.
//  Copyright © 2019 Danila Ferents. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (homeWorld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
