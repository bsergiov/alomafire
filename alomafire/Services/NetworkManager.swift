//
//  NetworkManager.swift
//  alomafire
//
//  Created by BSergio on 19.01.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
}

// MARK: - Signs
enum Signs: String, CaseIterable {
    
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

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
 
    func fetchForacast(for sign: String, completionHandler: @escaping(Forecast) -> Void) {
        let urlString = "https://sameer-kumar-aztro-v1.p.rapidapi.com/?sign=\(sign)&day=Today"
        let headers = HTTPHeaders(
            ["x-rapidapi-key" : "8cfd233fd1mshbc3fd7aed9f5f7bp1311d6jsn965cb2614615"]
        )
        AF.request(urlString, method: .post, headers: headers)
            .validate()
        
            .responseJSON { dataResponse in
                switch dataResponse.result {
              
                case .success(let value):
                    guard let forecastData = value as? [String: Any] else { return }
                    let forecast = Forecast(
                        dateRange: forecastData["date_range"] as? String,
                        currentDate: forecastData["current_date"] as? String,
                        description: forecastData["description"] as? String,
                        compatibility: forecastData["compatibility"] as? String,
                        mood: forecastData["mood"] as? String,
                        color: forecastData["color"] as? String,
                        luckyNumber: forecastData["lucky_number"] as? String,
                        luckyTime: forecastData["lucky_time"] as? String
                    )
                    completionHandler(forecast)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
