//
//  ContentView.swift

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = WeatherViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Погода в Уфе")
            Text(String(format: "Температура: %.1f °C", viewModel.weather.info.temp))
            Text("Влажность: \(viewModel.weather.info.humidity) %")
            Text("\(viewModel.weather.weather.first?.description ?? "")")
            Button("Обновить погоду") {
                viewModel.fetchWeather()
            }
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
