//
//  Detail.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 15/11/23.
//

import SwiftUI

struct Detail: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        ScrollView {
            if viewModel.comics.isEmpty {
                ProgressView()
            } else {
                ForEach(self.viewModel.comics) { comic in
                    DetailRow(comic: comic)
                }
            }
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(viewModel: DetailViewModel(id: 1, testing: true))
    }
}
