//
//  ContentView.swift
//  Weather-SwiftUI
//
//  Created by Lisa J on 5/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundView(topColor: .blue, bottomColor: .lightBlue)
            VStack {
                CityTextView(cityName: "Long Island City, NY")
                
                WeatherStationView(imageName: "cloud.sun.fill",
                                   temperature: 76)

                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 82)
                    WeatherDayView(dayOfWeek: "THURS",
                                   imageName: "cloud.drizzle.fill",
                                   temperature: 76)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.fog.fill",
                                   temperature: 70)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "sun.max.fill",
                                   temperature: 80)
                }

                Spacer()
                
                Button {
                    //action
                    print("tapped")
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
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(alignment: .center) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color

    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
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
                .renderingMode(.original)
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
