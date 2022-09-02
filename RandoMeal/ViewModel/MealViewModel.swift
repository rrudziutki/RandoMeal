//
//  MealViewModel.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import Foundation

protocol MealDelegate: AnyObject {
    func showMealInfo(_ meal: Meal)
    func presentErrorAlert(message: String)
    func activateDetailButton()
}

class MealViewModel {
    private let mealService: MealService
    weak var delegate: MealDelegate!
    var meal: Meal?
    var mealImageData: Data?
    
    init(mealService: MealService = MealService()) {
        self.mealService = mealService
    }
    
    func getMeal() {
        mealService.getRandomMeal { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let meals):
                self.meal = meals.all[0]
                self.mealImageData = self.mealService.loadImage(from: self.meal!.imageURL)
                self.delegate?.activateDetailButton()
                self.delegate?.showMealInfo(self.meal!)
            case .failure(let error):
                self.delegate?.presentErrorAlert(message: error.localizedDescription)
            }
        }
    }
}
