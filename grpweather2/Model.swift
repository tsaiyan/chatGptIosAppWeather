//
//  Model.swift

import SwiftUI

struct Weather: Codable {
    var info: WeatherInfo = .init(temp: 0, humidity: 0)
    var weather: [WeatherDetail] = []

    enum CodingKeys: String, CodingKey {
        case info = "main"
        case weather
    }
}

struct WeatherInfo: Codable {
    let temp: Double
    let humidity: Int
}

struct WeatherDetail: Codable {
    let main: String
    let description: String
}
