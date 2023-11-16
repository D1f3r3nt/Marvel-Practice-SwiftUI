//
//  ErrorTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest
import ViewInspector

@testable import marvel_practica_swiftui

final class ErrorTest: XCTestCase {

    func test_ui_view() throws {
        
        let view = ErrorView(errorText: "TEST ERROR")
        
        // Image
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        // Icon
        let icon = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(icon)
        
        // Message
        let message = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(message)
        
        let texto = try message.text().string()
        XCTAssertEqual(texto, "TEST ERROR")
    }

}
