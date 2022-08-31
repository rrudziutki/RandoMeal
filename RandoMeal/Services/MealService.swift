//
//  MealService.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import Foundation
import Alamofire

class MealService {
    
    func getRandomMeal(callback: @escaping (_ mealData: Meals) -> Void) {
        AF.request(K.apiRandomURL)
            .validate()
            .responseDecodable(of: Meals.self) { response in
                if let data = response.value {
                    callback(data)
                }
            } 
    }
}
