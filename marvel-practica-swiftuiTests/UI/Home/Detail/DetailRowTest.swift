//
//  DetailRowTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest
import ViewInspector

@testable import marvel_practica_swiftui

final class DetailRowTest: XCTestCase {

    let comic = Comic(
        id: 1,
        digitalID: 1,
        title: "Title of comic",
        issueNumber: 1,
        variantDescription: "",
        description: "I like so much programing",
        modified: "",
        isbn: "",
        upc: "",
        diamondCode: "",
        ean: "",
        issn: "",
        format: "",
        pageCount: 1,
        textObjects: [],
        resourceURI: "",
        urls: [],
        series: SeriesComic(resourceURI: "", name: ""),
        variants: [],
        dates: [],
        prices: [],
        thumbnail: ThumbnailComic(path: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806", thumbnailExtension: "jpg"),
        images: [],
        creators: Creators(available: 1, collectionURI: "", items: [], returned: 1),
        characters: CharacterComic(available: 1, collectionURI: "", items: [], returned: 1),
        stories: StoriesComic(available: 1, collectionURI: "", items: [], returned: 1),
        events: CharacterComic(available: 1, collectionURI: "", items: [], returned: 1)
    )
    
    func test_ui_view() throws {
        
        let view = DetailRow(comic: comic)
        
        // Background
        let background = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(background)
        
        let blackColor = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(blackColor)
        
        // Title
        let title = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(title)
        
        // Description
        let description = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(description)
    }

}
