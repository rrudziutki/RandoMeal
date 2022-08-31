//
//  MealViewModel.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import Foundation

protocol MealDelegate: AnyObject {
    func showMealInfo(_ meal: Meal)
    func activateDetailButton()
}

class MealViewModel {
    private let mealService: MealService
    weak var delegate: MealDelegate?
    var meal: Meal?
    var mealImageData: Data?
    
    init(mealService: MealService = MealService()) {
        self.mealService = mealService
    }
    
    func getMeal() {
        mealService.getRandomMeal { [unowned self] mealData in
            guard !mealData.all.isEmpty else {
                print("Brak danych")
                return // TODO ERROR HANDLING
            }
            self.meal = mealData.all[0]
            self.delegate?.activateDetailButton()
            self.delegate?.showMealInfo(mealData.all[0])
        }
    }
}
