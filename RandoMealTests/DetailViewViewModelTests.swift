//
//  DetailViewViewModelTests.swift
//  RandoMealTests
//
//  Created by RMakuchowski on 16/09/2022.
//

import XCTest
import RealmSwift
@testable import RandoMeal

class DetailViewViewModelTests: XCTestCase {
    let realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "testRealm"))
    var sut: DetailViewViewModel!
    var mealBuilder = MealBuilder()
    var meal = RealmMeal()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DetailViewViewModel(realm: realm)
    }
    
    override func tearDownWithError() throws {
    }
    
    func test_saveAndDelete() {
        let mockMeal = Meal(id: "0", name: "TestName", category: "TestCategory", area: "TestArea", instructions: "TestInstructions", imageURL: "www.imageurl.com")
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "randomMealImage", withExtension: ".jpg") else {
            fatalError("No mock image found")
        }
        let imageData = try! Data(contentsOf: url)
        meal = mealBuilder
            .copyFrom(mockMeal)
            .setImageData(imageData)
            .build()
        
        //Save
        sut.saveToRealm(meal)
        var rmMeal = realm.objects(RealmMeal.self)
        XCTAssertEqual(rmMeal.count, 1)
        XCTAssertEqual(meal.name, rmMeal[0].name)
        XCTAssertEqual(meal.area, rmMeal[0].area)
        XCTAssertEqual(meal.imageData, rmMeal[0].imageData)
        //Delete
        sut.deleteFromRealm(meal)
        rmMeal = realm.objects(RealmMeal.self)
        XCTAssertEqual(rmMeal.count, 0)
    }
}
