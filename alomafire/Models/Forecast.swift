//
//  Menu.swift
//  alomafire
//
//  Created by BSergio on 19.01.2022.
//

import Foundation

struct ForeCast: Codable {
    
    let sign: Signs?
    let luckyNumber: String?
    let luckyTime: String?
    let description: String?
    let currentDate: String?
  
    enum CodingKeys: String, CodingKey {
        case sign
        case luckyNumber
        case luckyTime
        case description
        case currentDate
    }
}

enum Signs: String, CaseIterable, Codable {
    
    case aries = "Aries"
    case taurus = "Taurus"
    case gemini = "Gemini"
    case cancer = "Cancer"
    case leo = "Leo"
    case virgo = "Virgo"
    case libra = "Libra"
    case scorpio = "Scorpio"
    case sagittarius = "Sagittarius"
    case capricorn = "Capricorn"
    case aquarius = "Aquarius"
    case pisces = "Pisces"
}
