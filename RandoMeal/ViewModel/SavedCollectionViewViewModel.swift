//
//  SaveCollectionViewViewModel.swift
//  RandoMeal
//
//  Created by RMakuchowski on 07/09/2022.
//

import Foundation
import RealmSwift

class SavedCollectionViewViewModel {
    private let realm: Realm
    var allMeals: Results<RealmMeal>!
    var selectedMeal = RealmMeal()
    
    func getMeals() {
        allMeals = realm.objects(RealmMeal.self)
    }
    
    init(realm: Realm = try! Realm()) {
        self.realm = realm
    }
    
    func saveToRealm(_ meal: RealmMeal) {
        do {
            try realm.write {
                realm.add(meal)
                //TODO FIX RE-ADDING BUG
            }
        } catch let error as NSError {
            print("An error occurred while saving to realm: \(error)")
        }
    }

    func deleteFromRealm(_ meal: RealmMeal) {
        try! realm.write {
            realm.delete(meal)
        }
    }

}
