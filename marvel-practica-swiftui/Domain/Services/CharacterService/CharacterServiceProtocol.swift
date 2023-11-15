//
//  CharacterServiceProtocol.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 14/11/23.
//

import Foundation
import Combine

protocol CharacterServiceProtocol: AnyObject {
    func getCharacters() -> AnyPublisher<CharactersResponse, Error>
}
