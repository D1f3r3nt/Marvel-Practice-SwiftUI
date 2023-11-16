//
//  DetailViewModel.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {
    @Published var comics: [Comic] = []
    
    var suscriptors = Set<AnyCancellable>()
    
    var service: CharacterServiceProtocol
    
    init(
        id: Int,
        testing: Bool = false,
        service: CharacterServiceProtocol = CharacterService()
    ) {
        self.service = service
        
        if (testing) {
            getComicsMock()
        } else {
            getComicsFromApi(by: id)
        }
    }
    
    private func getComicsFromApi(by id: Int) {
        self.comics = []
        
        service.getComics(by: String(id))
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Do it")
                }
            } receiveValue: { data in
                print(data)
                self.comics = data.data.results
            }
            .store(in: &suscriptors)
    }
    
    
    private func getComicsMock() {
        let mockComic = Comic(
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
        
        self.comics = [mockComic, mockComic, mockComic, mockComic]
    }
}
