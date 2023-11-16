//
//  DetailRow.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 16/11/23.
//

import SwiftUI

struct DetailRow: View {
    var comic: Comic
    
    var body: some View {
        ZStack(alignment: .leading) {
            AsyncImage(url: URL(string: getImage(data: comic.thumbnail))) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .background(.gray)
                    .cornerRadius(20)
                    .frame(width: 100, height: 100)
            }
            
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.4)
            
            VStack(alignment: .leading) {
                Text(comic.title)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding([.bottom], 20)
                
                Text(comic.description ?? "")
                    .font(.body)
                    .foregroundColor(.white)
                
                Spacer()
            }
            .frame(maxHeight: 500)
            .padding()
        }
        .frame(maxHeight: 500)
        .cornerRadius(20)
        .padding()
    }
    
    private func getImage(data thumbnail: ThumbnailComic) -> String {
        return "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
    }
}

struct DetailRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailRow(comic: Comic(
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
        ))
    }
}
