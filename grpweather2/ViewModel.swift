//
//  ViewModel.swift

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var weather = Weather()

    func fetchWeather() {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Ufa&appid=b2df10fcf43f104b7e6b304765fc67e3&units=metric")!
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                let decoder = JSONDecoder()
                if let weather = try? decoder.decode(Weather.self, from: data) {
                    DispatchQueue.main.async {
                        self.weather = weather
                    }
                }
            }
        }
        session.resume()
    }
}
