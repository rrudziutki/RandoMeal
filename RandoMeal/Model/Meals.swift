//
//  Meal.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 23/08/2022.
//

import CoreText

struct Meals: Codable {
    var all: [Meal]
    
    enum CodingKeys: String, CodingKey {
        case all = "meals"
    }
}

struct Meal: Codable, Equatable {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case imageURL = "strMealThumb"
    }
}
