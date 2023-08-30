//
//  MovieDetailScreen.swift
//  MoviesApp
//
//  Created by Duhan Boblanlı on 31.08.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieDetailScreen: View {
    
    let imdbId: String
    @ObservedObject var movieDetailVM = MovieDetailViewModel()
    
    var body: some View {
        VStack {
            
            if movieDetailVM.loadingState == .loading {
                LoadingView()
            } else if movieDetailVM.loadingState == .success {
                MovieDetailView(movieDetailVM: movieDetailVM)
            } else if movieDetailVM.loadingState == .failed {
                FailedView()
            }
            
        } // ends of VStack
        .onAppear {
            self.movieDetailVM.getDetailsByImdbId(imdbId: self.imdbId)
        }
    }
}

