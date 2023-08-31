//
//  String+Extensions.swift
//  MoviesApp
//
//  Created by Duhan Boblanlı on 30.08.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

extension String {
    
    // Search işleminde boşlukları engellemek için
    func trimmedAndEscaped() -> String {
        
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines )
        return trimmedString
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
