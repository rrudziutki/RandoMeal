//
//  MealViewModelDelegate.swift
//  RandoMealTests
//
//  Created by RMakuchowski on 02/09/2022.
//

import Foundation
@testable import RandoMeal

class MockMealViewModelDelegate: MealDelegate {
    var isShowMealInfoCalled = false
    var isPresentErrorCalled = false
    var isActivateDetailButtonCalled = false
    
    func showMealInfo(_ meal: Meal) {
        isShowMealInfoCalled = true
    }
    
    func presentErrorAlert(message: String) {
        isPresentErrorCalled = true
    }
    
    func activateDetailButton() {
        isActivateDetailButtonCalled = true
    }
    
    
}
