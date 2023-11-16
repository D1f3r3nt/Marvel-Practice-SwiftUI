//
//  RootViewTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest
import ViewInspector

@testable import marvel_practica_swiftui

final class RootViewTest: XCTestCase {

    func test_ui_view() throws {
        
        let view = RootView()
            .environmentObject(RootViewModel(testing: true))
        
        let pages = try view.inspect().count
        XCTAssertEqual(1, pages)
    }

}
