//
//  HomeRowTest.swift
//  marvel-practica-swiftuiTests
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import XCTest
import ViewInspector

@testable import marvel_practica_swiftui

final class HomeRowTest: XCTestCase {
    
    let character = Character(
        id: 1011334,
        name: "3-D Man",
        description: "",
        modified: "",
        thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: "jpg"
        ),
        resourceURI: "http://gateway.marvel.com/v1/public/characters/1011334",
        comics: Comics(
            available: 12,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            items: [
                ComicsItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                    name: "Avengers: The Initiative (2007) #14"
                )
            ],
            returned: 12
        ),
        series: Comics(
            available: 12,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            items: [
                ComicsItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                    name: "Avengers: The Initiative (2007) #14"
                )
            ],
            returned: 12
        ),
        stories: Stories(
            available: 12,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            items: [
                StoriesItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/stories/19947",
                    name: "Cover #19947",
                    type: "cover"
                )
            ],
            returned: 12
        ),
        events: Comics(
            available: 12,
            collectionURI: "http://gateway.marvel.com/v1/public/characters/1011334/comics",
            items: [
                ComicsItem(
                    resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                    name: "Avengers: The Initiative (2007) #14"
                )
            ],
            returned: 12
        ),
        urls: [
            URLElement(
                type: "detail",
                url: "http://marvel.com/characters/74/3-d_man?utm_campaign=apiRef&utm_source=808a8a06bb441aba483dd693f6c3056d"
            )
        ]
    )

    func test_ui_view() throws {
        
        let view = HomeRow(character: character)
        
        // Background
        let background = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(background)
        
        let black_color = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(black_color)
        
        // Text
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        // Image
        let image = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(image)
    }
}
