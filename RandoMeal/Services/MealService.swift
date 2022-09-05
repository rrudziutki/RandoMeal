//
//  MealService.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import Foundation
import Alamofire

class MealService {
    func getRandomMeal(callback: @escaping (_ mealData: Result<Meals, Error>) -> Void) {
        AF.request(K.apiRandomURL)
            .validate()
            .responseDecodable(of: Meals.self) { response in
                if let error = response.error {
                    callback(.failure(error))
                }
                if let data = response.value {
                    callback(.success(data))
                }
            }
    }
    
    func loadImage(from url: String, callback: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url)
            .validate()
            .response { response in
                if let error = response.error {
                    callback(.failure(error))
                }
                if let data = response.data {
                    callback(.success(data))
                }
            }
    }
}
