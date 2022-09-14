//
//  K.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 23/08/2022.
//

import Foundation

struct K {
    // MARK: - API
    static let apiRandomURL = "https://www.themealdb.com/api/json/v1/1/random.php"
    static let apiMealSearch = "https://www.themealdb.com/"
    
    // MARK: - Seques
    static let detailSequeIdentifier = "detail"
    static let savedSequeIdentifier = "saved"
    static let savedToDetailSequeIdentifier = "saveToDetail"
    
    // MARK: - IB Identifier
    static let nibMealCellIdentifier = "MealCell"
}
