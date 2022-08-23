//
//  Meal.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 23/08/2022.
//

import Foundation
import CoreText


struct Meals: Codable {
    var meals: [Meal]
}

struct Meal: Codable {
    var id: String
    var name: String
    var category: String
    var area: String
    var instructions: String
    var image: String
    
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case instructions = "strInstructions"
        case image = "strMealThumb"
    }
}
