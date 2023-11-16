//
//  LoadingTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest
import ViewInspector

@testable import marvel_practica_swiftui

final class LoadingTest: XCTestCase {

    func test_ui_view() throws {
        
        let view = Loading()
        
        // Image
        let img = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(img)
        
        // Progress
        let progress = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(progress)
    }

}
