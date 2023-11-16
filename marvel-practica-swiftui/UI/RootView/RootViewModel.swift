//
//  RootViewModel.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 15/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    @Published var characters: Characters = []
    @Published var status = Status.none
    
    var testing: Bool
    var suscriptors = Set<AnyCancellable>()
    var service: CharacterServiceProtocol
    
    init(
        testing: Bool = false,
        service: CharacterServiceProtocol = CharacterService()
    ) {
        self.service = service
        self.testing = testing
        
        if (testing) {
            getCharactersTesting()
        } else {
            getCharacters()
        }
    }
    
    func getCharacters() {
        self.status = .loading
        
        service.getCharacters()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self.status = .error(error: "Error buscando personajes")
                case .finished:
                    self.status = .none
                }
            } receiveValue: { data in
                self.characters = data.data.results
            }
            .store(in: &suscriptors)

    }
    
    func getCharactersTesting() {
        self.status = .loading
        self.characters = getCharactersFake()
        self.status = .none
    }
    
    private func getCharactersFake() -> Characters {
        
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
        
        let data = CharactersResponse(
            code: 0,
            status: "",
            copyright: "",
            attributionText: "",
            attributionHTML: "",
            etag: "",
            data: DataClass(
                offset: 0,
                limit: 0,
                total: 0,
                count: 0,
                results: [character, character, character, character, character, character, character, character]
            )
        )
        
        return data.data.results
    }
}

