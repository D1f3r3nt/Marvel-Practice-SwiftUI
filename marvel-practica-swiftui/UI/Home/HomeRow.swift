//
//  HomeRow.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 14/11/23.
//

import SwiftUI

struct HomeRow: View {
    var character: Character
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: getImage(data: character.thumbnail))) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .background(.gray)
                    .cornerRadius(20)
                    .frame(width: 100, height: 100)
            }
            
            Image(decorative: "")
                .resizable()
                .background(
                    LinearGradient(colors: [.white, .black], startPoint: .bottomTrailing, endPoint: .topLeading)
                )
                .opacity(0.4)
            
            HStack {
                Text("\(character.name)")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            }
            .padding()
            
        }
        .frame(maxHeight: 250)
        .cornerRadius(20)
        .padding()
    }
    
    private func getImage(data thumbnail: Thumbnail) -> String {
        return "\(thumbnail.path).\(thumbnail.thumbnailExtension)"
    }
}

struct HomeRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeRow(character: Character(
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
        ))
    }
}
