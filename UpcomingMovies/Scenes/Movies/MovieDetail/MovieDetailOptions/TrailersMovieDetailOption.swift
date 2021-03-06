//
//  TrailersMovieDetailOption.swift
//  UpcomingMovies
//
//  Created by Alonso on 12/8/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import UIKit

class TrailersMovieDetailOption: MovieDetailOption {
    
    var title: String {
        return LocalizedStrings.trailersDetailOptions.localized
    }
    
    var icon: UIImage {
        return #imageLiteral(resourceName: "PlayVideo")
    }
    
    func prepare(coordinator: MovieDetailCoordinatorProtocol?) {
        guard let coordinator = coordinator else { fatalError() }
        coordinator.showMovieVideos()
    }
    
}
