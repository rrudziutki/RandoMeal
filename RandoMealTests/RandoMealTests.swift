//
//  RandoMealTests.swift
//  RandoMealTests
//
//  Created by Remigiusz Makuchowski on 22/08/2022.
//

import XCTest
@testable import RandoMeal

class RandoMealTests: XCTestCase {
    var sut: MealViewModel!
    var mockService: MealServiceMock!
    var delegate: MockMealViewModelDelegate!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockService = MealServiceMock()
        delegate = MockMealViewModelDelegate()
        sut = MealViewModel(mealService: mockService)
        sut.delegate = delegate
    }

    override func tearDownWithError() throws {
        sut = nil
        mockService = nil
        delegate = nil
        try super.tearDownWithError()
    }

    func test_getUsers() {
        mockService.mockType = .valid
        sut.getMeal()
        XCTAssertEqual(sut.meal, Meal(id: "0", name: "TestName", category: "TestCategory", area: "TestArea", instructions: "TestInstructions", imageURL: "www.imageurl.com"))
        XCTAssertFalse(delegate.isPresentErrorCalled)
        XCTAssertTrue(delegate.isConfigureImageCalled)
        XCTAssertTrue(delegate.isActivateDetailButtonCalled)
        XCTAssertTrue(delegate.isShowMealInfoCalled)
    }
    
    func test_getError() {
        mockService.mockType = .error
        sut.getMeal()
        XCTAssertEqual(sut.meal, nil)
        XCTAssertFalse(delegate.isActivateDetailButtonCalled)
        XCTAssertFalse(delegate.isConfigureImageCalled)
        XCTAssertFalse(delegate.isShowMealInfoCalled)
        XCTAssertTrue(delegate.isPresentErrorCalled)
    }
    
    func test_getUsersThenGetErrorImage() {
        mockService.mockType = .mealValid_imageError
        sut.getMeal()
        XCTAssertEqual(sut.meal, Meal(id: "0", name: "TestName", category: "TestCategory", area: "TestArea", instructions: "TestInstructions", imageURL: "www.imageurl.com"))
        XCTAssertFalse(delegate.isConfigureImageCalled)
        XCTAssertTrue(delegate.isPresentErrorCalled)
        XCTAssertTrue(delegate.isActivateDetailButtonCalled)
        XCTAssertTrue(delegate.isShowMealInfoCalled)
    }
    
    

}
