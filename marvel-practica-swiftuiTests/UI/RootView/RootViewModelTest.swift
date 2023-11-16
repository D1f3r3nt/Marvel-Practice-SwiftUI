//
//  RootViewModelTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest

@testable import marvel_practica_swiftui

final class RootViewModelTest: XCTestCase {

    func test_view_model() {
        let vm = RootViewModel(testing: true)
        
        // 8 mock Character
        XCTAssertEqual(8, vm.characters.count)
        
        // Correct Character Name
        let characterName =  vm.characters.first?.name
        XCTAssertEqual("3-D Man", characterName)
    }

}
