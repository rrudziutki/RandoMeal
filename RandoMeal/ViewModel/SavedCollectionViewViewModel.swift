//
//  SaveCollectionViewViewModel.swift
//  RandoMeal
//
//  Created by RMakuchowski on 07/09/2022.
//

import Foundation
import RealmSwift

class SavedCollectionViewViewModel {
    private let realm = try! Realm()
    var allMeals: Results<RealmMeal>
    var selectedMeal = RealmMeal()
    
    init() {
        allMeals = realm.objects(RealmMeal.self)
        print(allMeals.forEach({ meal in
            print(meal.name)
        }))
    }
    
    func getMeals() {
        allMeals = realm.objects(RealmMeal.self)
    }
    
    func deleteMeal(_ meal: RealmMeal) {
        try! realm.write {
            realm.delete(meal)
        }
    }
}
