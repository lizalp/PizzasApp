//
//  Pizza.swift
//  PizzaApp
//
//  Created by Liz Alpizar on 28/06/24.
//

import Foundation

// Estructura para las coordenadas
struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

// Estructura para las pizzerías
struct Pizzeria: Codable {
    let name: String
    let address: String
    let coordinates: Coordinates?
}

// Estructura para las pizzas
struct Pizza: Codable {
    let name: String
    let ingredients: [String]
}

// Estructura para los datos completos del JSON
struct PizzaData: Codable {
    let pizzerias: [Pizzeria]
    let pizzas: [Pizza]
    let ingredients: [String]
}
