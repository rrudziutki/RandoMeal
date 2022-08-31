//
//  MealViewModel.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import Foundation

protocol MealDelegate: AnyObject {
    func showMealInfo(_ meal: Meal)
}

final class MealViewModel {
    private let mealService: MealService
    weak var delegate: MealDelegate?
    
    init(mealService: MealService) {
        self.mealService = mealService
    }
    
    func getMealDescription() {
        mealService.getRandomMeal { [weak self] mealData in
            guard !mealData.all.isEmpty else {
                print("Brak danych")
                return // TODO ERROR HANDLING
            }
            self?.delegate?.showMealInfo(mealData.all[0])
        }
    }
}
