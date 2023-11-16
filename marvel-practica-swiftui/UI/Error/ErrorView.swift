//
//  Error.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 15/11/23.
//

import SwiftUI

struct ErrorView: View {
    var errorText: String
    
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .id(0)
            
            VStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding()
                    .id(1)
                
                Text(errorText)
                    .font(.title)
                    .foregroundColor(.white)
                    .id(2)
            }
        }
    }
}

struct Error_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(errorText: "Test")
    }
}
