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
        XCTAssertEqual(sut.meal?.id, "0")
        XCTAssertEqual(sut.meal?.name, "TestName")
        XCTAssertEqual(sut.meal?.instructions, "TestInstructions")
        XCTAssertFalse(delegate.isPresentErrorCalled)
        XCTAssertTrue(delegate.isActivateDetailButtonCalled)
        XCTAssertTrue(delegate.isShowMealInfoCalled)
    }
    
    func test_getError() {
        mockService.mockType = .error
        sut.getMeal()
        XCTAssertFalse(delegate.isActivateDetailButtonCalled)
        XCTAssertFalse(delegate.isShowMealInfoCalled)
        XCTAssertTrue(delegate.isPresentErrorCalled)
    }
    
    

}
