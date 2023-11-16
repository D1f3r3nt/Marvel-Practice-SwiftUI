//
//  DetailViewModelTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest

@testable import marvel_practica_swiftui

final class DetailViewModelTest: XCTestCase {

    func test_view_model() {
     
        let vm = DetailViewModel(id: 1, testing: true)
        
        // 4 Mock Comics
        XCTAssertEqual(4, vm.comics.count)
        
        // Correct Comic
        let comicName = vm.comics.first?.title
        XCTAssertEqual("Title of comic", comicName)
        
    }
}
