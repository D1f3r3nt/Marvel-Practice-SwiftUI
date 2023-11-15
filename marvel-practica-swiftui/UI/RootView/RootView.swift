//
//  RootView.swift
//  marvel-practica-swiftui
//
//  Created by Marc Santisteban Ruiz on 14/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        switch rootViewModel.status {
        case .none:
            withAnimation {
                Home()
            }
        case .loading:
            withAnimation {
                Loading()
            }
        case .error(error: let errorString):
            withAnimation {
                ErrorView(errorText: errorString)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
