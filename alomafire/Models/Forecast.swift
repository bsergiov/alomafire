//
//  Menu.swift
//  alomafire
//
//  Created by BSergio on 19.01.2022.
//

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    
    let dateRange: String?
    let currentDate: String?
    let description: String?
    let compatibility: String?
    let mood: String?
    let color: String?
    let luckyNumber: String?
    let luckyTime: String?
  
}


