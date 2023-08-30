//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Duhan Boblanlı on 30.08.2023.
//  Copyright © 2023 Mohammad Azam. All rights reserved.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}
class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
