//
//  Constants.swift
//  StarTrivia
//
//  Created by vagelis spirou on 25/09/2019.
//  Copyright © 2019 vagelis spirou. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.co/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseCompletion = (Person?) -> Void
typealias HomeworldResponseCompletion = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
typealias StarshipResponseCompetion = (Starship?) -> Void
