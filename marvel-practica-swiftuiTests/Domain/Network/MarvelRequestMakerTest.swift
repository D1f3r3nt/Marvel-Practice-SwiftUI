//
//  MarvelRequestMakerTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest

@testable import marvel_practica_swiftui

final class MarvelRequestMakerTest: XCTestCase {

    let maker = MarvelRequestMaker()
    
    func test_request_comcics() {
        let request = maker.getComics(by: "1")
        
        XCTAssertEqual("GET", request.httpMethod)
        
        XCTAssertTrue(((request.url?.absoluteString
            .contains("https://gateway.marvel.com/v1/public/characters/1/comics")) != nil))
    }
    
    func test_request_characters() {
        let request = maker.getCharacters()
        
        XCTAssertEqual("GET", request.httpMethod)
        
        XCTAssertTrue(((request.url?.absoluteString
            .contains("https://gateway.marvel.com/v1/public/characters")) != nil))
    }

}
