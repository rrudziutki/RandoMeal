//
//  DetailVCViewModel.swift
//  RandoMeal
//
//  Created by RMakuchowski on 15/09/2022.
//

import Foundation
import RealmSwift

class DetailViewViewModel {
    private let realm: Realm
    
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
