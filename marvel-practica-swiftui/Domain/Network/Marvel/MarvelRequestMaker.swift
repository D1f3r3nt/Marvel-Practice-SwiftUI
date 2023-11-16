//
//  BaseNetword.swift
//  kcHerosClase
//
//  Created by Marc Santisteban Ruiz on 7/11/23.
//

import Foundation
import CryptoKit

let server = "https://gateway.marvel.com"
let ts = "1"
let orderBy = "modified"

// Original
//let apiKey = "808a8a06bb441aba483dd693f6c3056d"
//let privateKey = "270416523c21984c6ba7ae21a3aca31c05e281b7"

// Second
let apiKey = "9e29a1b538598cc40c0eea1cb004c319"
let privateKey = "8618a98177baca915891777d0e4f95947ea79dcc"

enum endpoints: String {
    case characters = "/v1/public/characters"
}

struct MarvelRequestMaker {
    func getCharacters() -> URLRequest {
        let hashKey = MD5(string: "\(ts)\(privateKey)\(apiKey)")
        
        var urlCad = "\(server)\(endpoints.characters.rawValue)?"
        urlCad += "apikey=\(apiKey)"
        urlCad += "&ts=\(ts)"
        urlCad += "&hash=\(hashKey)"
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    func getComics(by id: String) -> URLRequest {
        let hashKey = MD5(string: "\(ts)\(privateKey)\(apiKey)")
        
        var urlCad = "\(server)\(endpoints.characters.rawValue)/\(id)/comics?"
        urlCad += "apikey=\(apiKey)"
        urlCad += "&ts=\(ts)"
        urlCad += "&hash=\(hashKey)"
        
        print("URL COMICS: \(urlCad)")
        
        var request: URLRequest = URLRequest(url: URL(string: urlCad)!)
        
        request.httpMethod = HTTPMethods.get
        
        return request
    }
    
    private func MD5(string: String) -> String {
        let digest = Insecure.MD5.hash(data: Data(string.utf8))

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
