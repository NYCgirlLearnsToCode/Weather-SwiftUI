//
//  Weather.swift
//  Weather-SwiftUI
//
//  Created by Lisa J on 5/23/25.
//

import Foundation

struct Weather: Identifiable {
    var id = UUID()
    var dayOfWeek: Day
    var imageName: WeatherImage
    var temperature: Int
}

enum Day: String {
    case mon = "MON"
    case tue = "TUE"
    case wed = "WED"
    case thu = "THURS"
    case fri = "FRI"
}

enum WeatherImage: String {
    case cloudSun = "cloud.sun.fill"
    case sunMax = "sun.max.fill"
    case cloudDriz = "cloud.drizzle.fill"
    case cloudFog = "cloud.fog.fill"
}
