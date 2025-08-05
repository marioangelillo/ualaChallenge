//
//  UalaChallengeUITests.swift
//  UalaChallengeUITests
//
//  Created by Mario Angelillo on 02/08/2025.
//

import XCTest

final class UalaChallengeUITests: XCTestCase {
    var app: XCUIApplication!
    let timeout = 5.0
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["testing"]
        app.launch()
    }
    
    func testTextField() {
        let textField = app.textFields["SearchBar"]
        XCTAssertTrue(textField.waitForExistence(timeout: timeout), "No se encontró el campo de búsqueda")
        
        textField.tap()
        textField.typeText("Amsterdam")

        sleep(1)

        XCTAssertEqual(textField.value as? String, "Amsterdam", "El campo de texto debería contener 'Amsterdam'")
    }

    func testFavoritesToggleTap() {
        let toggle = app.switches["FavoritesToggle"]
        XCTAssertTrue(toggle.waitForExistence(timeout: 5), "No se encontró el toggle de favoritos")
        
        toggle.tap()
    }
    
    func testCityAppearsInList() {
        let cell = app.staticTexts["'t Hoeksken, BE"]
        XCTAssertTrue(cell.waitForExistence(timeout: timeout), "La ciudad mockeada 't Hoeksken, BE' no aparece en la lista")
    }
}
