//
//  RealmMeal.swift
//  RandoMeal
//
//  Created by RMakuchowski on 06/09/2022.
//

import Foundation
import RealmSwift

class RealmMeal: Object {
    @Persisted var id: String = ""
    @Persisted var name: String = ""
    @Persisted var category: String = ""
    @Persisted var area: String = ""
    @Persisted var instructions: String = ""
    @Persisted var imageData: Data = Data()
}

class MealBuilder {
    var meal = RealmMeal()
    
    func copyFrom(_ meal: Meal) -> MealBuilder {
        self.meal.id = meal.id
        self.meal.name = meal.name
        self.meal.category = meal.category
        self.meal.area = meal.area
        self.meal.instructions = meal.instructions
        return self
    }

    func setID(_ id: String) -> MealBuilder {
        meal.id = id
        return self
    }
    
    func setName(_ name: String) -> MealBuilder {
        meal.name = name
        return self
    }
    
    func setCategory(_ category: String) -> MealBuilder {
        meal.category = category
        return self
    }
    
    func setArea(_ area: String) -> MealBuilder {
        meal.area = area
        return self
    }
    
    func setInstructions(_ instructions: String) -> MealBuilder {
        meal.instructions = instructions
        return self
    }
    
    func setImageData(_ data: Data) -> MealBuilder {
        meal.imageData = data
        return self
    }
    
    func build() -> RealmMeal {
        return meal
    }
}
