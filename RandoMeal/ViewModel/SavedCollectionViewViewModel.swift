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
    let allMeals: Results<RealmMeal>
    
    init() {
        allMeals = realm.objects(RealmMeal.self)
        print(allMeals.forEach({ meal in
            print(meal.name)
        }))
    }
}
