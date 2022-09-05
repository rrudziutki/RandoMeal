//
//  MealServiceMock.swift
//  RandoMealTests
//
//  Created by RMakuchowski on 02/09/2022.
//

import Foundation
@testable import RandoMeal
import CoreText

class MealServiceMock: MealService {
    var mockType: MockType!
    
    override func getRandomMeal(callback: @escaping (Result<Meals, Error>) -> Void) {
        switch mockType {
        case .valid:
            callback(.success(Meals(all: [Meal(id: "0", name: "TestName", category: "TestCategory", area: "TestArea", instructions: "TestInstructions", imageURL: "www.imageurl.com")])))
        case .error:
            callback(.failure(MockError.error))
        case .mealValid_imageError:
            callback(.success(Meals(all: [Meal(id: "0", name: "TestName", category: "TestCategory", area: "TestArea", instructions: "TestInstructions", imageURL: "www.imageurl.com")])))
        default:
            fatalError("Should not be called")
        }
    }
    
    override func loadImage(from url: String, callback: @escaping (Result<Data, Error>) -> Void) {
        switch mockType {
        case .valid:
            let bundle = Bundle(for: type(of: self))
            guard let url = bundle.url(forResource: "randomMealImage", withExtension: ".jpg") else {
                fatalError("No mock image found")
            }
            let data = try! Data(contentsOf: url)
            callback(.success(data))
        case .error:
            callback(.failure(MockError.error))
        case .mealValid_imageError:
            callback(.failure(MockError.error))
        default:
            fatalError("Should not be called")
        }
    }
}

enum MockError: Error {
    case error
}

enum MockType {
    case valid
    case error
    case mealValid_imageError
}
