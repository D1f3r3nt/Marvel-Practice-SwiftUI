//
//  DetailTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest
import ViewInspector

@testable import marvel_practica_swiftui

final class DetailTest: XCTestCase {

    func test_ui_view() throws {
        
        let view = Detail(viewModel: DetailViewModel(id: 1, testing: true))
        
        let items = try view.inspect().count
        XCTAssertEqual(1, items)
        
        // Scroll
        let scroll = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(scroll)
    }

}
