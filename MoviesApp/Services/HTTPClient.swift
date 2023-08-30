//
//  HTTPClient.swift
//  MoviesApp
//
//  Created by Duhan Boblanlı on 30.08.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

// Custom error
enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

class HTTPClient {
    
    func getMovieDetailsBy(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        
        // URL control
        guard let url = URL.forMoviesByImdbId(imdbId) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Data control
            guard let data = data, error == nil else {
                return completion(. failure(.noData))
            }
            
            // Decoding control with MovieDetail model
            guard let movieDetail = try? JSONDecoder ( ) .decode (MovieDetail.self, from: data) else {
                return completion(. failure(. decodingError))
            }
            
            // if every control is success
            completion(.success(movieDetail))
            
        }.resume()
    }
    
    func getMoviesBy(search: String, completion: @escaping (Result<[Movie]?,NetworkError>) -> Void) {
        
        // URL control
        guard let url = URL.forMoviesByName(search) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Data control
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            // Decoding control with MovieResponse model
            guard let moviesResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) else {
                return completion(.failure(.decodingError))
            }
            
            // if every control is success
            completion(.success(moviesResponse.movies))
            
        }.resume()
    }
    
    
}
