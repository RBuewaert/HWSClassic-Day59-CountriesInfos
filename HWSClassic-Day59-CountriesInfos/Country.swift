//
//  Country.swift
//  Project15M
//
//  Created by Romain Buewaert on 27/10/2021.
//

import Foundation

struct Countries: Codable {
    let countries: [Country]
}

struct Country: Codable {
    let name: String
    let capitalCity: String
    let language: String
    let area: Int
    let waterArea: String
    let population: Int
}
