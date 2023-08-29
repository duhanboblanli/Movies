//
//  URL+Extensions.swift
//  MoviesApp
//
//  Created by Duhan Boblanlı on 30.08.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

extension URL {
    
    static func forMoviesByName(_ name: String) -> URL? {
        return URL(string: "https://www.omdbapi.com/?apikey=\(Constants.API_KEY)&s=\(name)")
    }
    
}
