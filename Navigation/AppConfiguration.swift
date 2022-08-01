//
//  Config.swift
//  Navigation
//
//  Created by itroshenkov on 17.06.2022.
//

import Foundation
// Задание IOSDT 1.1:
enum AppConfiguration: String, CaseIterable {
    
    case people = "https://swapi.dev/api/people/8"
    case starships = "https://swapi.dev/api/starships/3"
    case planets = "https://swapi.dev/api/planets/5"
    
    static func randomURL() -> String {
        AppConfiguration.allCases.randomElement()?.rawValue ?? "Eroor to get the random URL"
    }
}
