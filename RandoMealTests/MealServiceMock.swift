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
        case .none:
            fatalError()
        }
    }
}

enum MockError: Error {
    case error
}

enum MockType {
    case valid
    case error
}
