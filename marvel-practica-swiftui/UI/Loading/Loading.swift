//
//  Loading.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 15/11/23.
//

import SwiftUI

struct Loading: View {
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .id(0)
            
            ProgressView()
                .scaleEffect(3)
                .progressViewStyle(CircularProgressViewStyle(tint: Color.orange))
                .id(1)
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading()
    }
}
