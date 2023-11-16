//
//  CharacterServiceMock.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 14/11/23.
//

import Foundation
import Combine

final class CharacterServiceMock: CharacterServiceProtocol {
    func getComics(by id: String) -> AnyPublisher<ComicResponse, Error> {
        let data = ComicResponse(
            code: 200,
            status: "ok",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: DataClassComic(
                offset: 0,
                limit: 0,
                total: 0,
                count: 0,
                results: []
            )
        )
        
        let publicador = CurrentValueSubject<ComicResponse, Error>(data)
        return publicador.eraseToAnyPublisher()
    }
    
    func getCharacters() -> AnyPublisher<CharactersResponse, Error> {
        let data = CharactersResponse(
            code: 200,
            status: "ok",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: DataClass(
                offset: 0,
                limit: 0,
                total: 0,
                count: 0,
                results: []
            )
        )
        
        let publicador = CurrentValueSubject<CharactersResponse, Error>(data)
        return publicador.eraseToAnyPublisher()
    }
}
