//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Lisa J on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false

    var weatherArr = [Weather(dayOfWeek: .mon, imageName: .cloudSun, temperature: 74),
                      Weather(dayOfWeek: .tue, imageName: .cloudSun, temperature: 82),
                      Weather(dayOfWeek: .wed, imageName: .cloudDriz, temperature: 76),
                      Weather(dayOfWeek: .thu, imageName: .cloudFog, temperature: 60),
                      Weather(dayOfWeek: .fri, imageName: .sunMax, temperature: 85)]
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Long Island City, NY")
                
                WeatherStationView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                   temperature: 76)

                HStack(spacing: 20) {
                    ForEach(weatherArr) { weather in
                        WeatherDayView(weather: weather)
                    }
                }

                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {

    var weather: Weather
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(weather.dayOfWeek.rawValue)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: weather.imageName.rawValue)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(weather.temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool

    var body: some View {
        // custom gradient
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : .lightBlue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32.0, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStationView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height:180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
