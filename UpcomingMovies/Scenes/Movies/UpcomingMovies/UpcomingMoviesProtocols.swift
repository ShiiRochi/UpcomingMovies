//
//  UpcomingMoviesProtocols.swift
//  UpcomingMovies
//
//  Created by Alonso on 6/28/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import UIKit
import UpcomingMoviesDomain

protocol UpcomingMoviesViewModelProtocol {
    
    var viewState: Bindable<SimpleViewState<Movie>> { get set }
    var startLoading: Bindable<Bool> { get set }
    
    var movieCells: [UpcomingMovieCellViewModelProtocol] { get }
    var needsPrefetch: Bool { get }
    
    func getMovies()
    func refreshMovies()
    
    func movie(for index: Int) -> Movie
    
}

protocol UpcomingMoviesCoordinatorProtocol: class {
    
    func showMovieDetail(for movie: Movie, with navigationConfiguration: NavigationConfiguration?)
    
}

protocol UpcomingMoviesNavigationDelegate: class, UINavigationControllerDelegate {
    
    var parentCoordinator: Coordinator? { get set }
    
    func configure(selectedFrame: CGRect?, with imageToTransition: UIImage?)
    func updateOffset(_ verticalSafeAreaOffset: CGFloat)
    
}
