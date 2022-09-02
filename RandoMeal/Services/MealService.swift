//
//  MealService.swift
//  RandoMeal
//
//  Created by Remigiusz Makuchowski on 30/08/2022.
//

import Foundation
import Alamofire

class MealService {
    func getRandomMeal(callback: @escaping (_ mealData: Result<Meals, AFError>) -> Void) {
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
    
    func loadImage(from url: String) -> Data {
        var dataImage = Data()
        guard let url = URL(string: url) else {
            return dataImage
        }
        AF.request(url)
            .validate()
            .response { response in
                guard let unwrappedData = response.data else { return }
                dataImage = unwrappedData
            }
        return dataImage
    }
}

