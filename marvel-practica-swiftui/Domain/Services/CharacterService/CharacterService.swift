//
//  CharacterService.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 14/11/23.
//
import Foundation
import Combine

final class CharacterService: CharacterServiceProtocol {
    
    let networker: NetworkerProtocol
    let requestMaker: MarvelRequestMaker
    
    init(
        network: NetworkerProtocol = Networker(),
        requestMaker: MarvelRequestMaker = MarvelRequestMaker()
    ) {
        self.networker = network
        self.requestMaker = requestMaker
    }
    
    func getCharacters() -> AnyPublisher<CharactersResponse, Error> {
        return networker.callServer(
            type: CharactersResponse.self,
            request: requestMaker.getCharacters()
        )
        
    }
}
