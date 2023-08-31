//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Duhan Boblanlı on 30.08.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    // MovieListViewModel'daki @Published movies ile aynı liste
    // Orada güncellenirse burada da değişir, yani searchleme işlemine göre model güncellenir ve burada kullanılır
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCell(movie: movie) // Cell'e tıklanırsa detail screen açılır
            }
        }
    }
}

struct MovieCell: View {
    
    let movie: MovieViewModel
    
    var body: some View {
        HStack (alignment: .top) {
            
            URLImage (url: movie.poster)
                .frame (width: 100, height: 120)
                .cornerRadius (6)
            
            VStack (alignment: .leading) {
                Text (movie.title)
                    .font(.headline)
                
                Text(movie.year)
                    .opacity(0.5)
                    .padding(.top,10)
                
            }.padding(5)
            Spacer()
        }.contentShape(Rectangle())
    }
}
