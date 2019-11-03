//
//  InjectionFactory.swift
//  UpcomingMovies
//
//  Created by Alonso on 11/1/19.
//  Copyright © 2019 Alonso. All rights reserved.
//

import Foundation
import Domain
import CoreDataPlatform
import UpcomingMoviesData

final class InjectionFactory {
    
    class func useCaseProvider() -> UseCaseProviderProtocol {
        let localDataSource = makeLocalDataSource()
        return UseCaseProvider(localDataSource: localDataSource)
    }
    
    class func makeLocalDataSource() -> LocalDataSourceProtocol {
        return LocalDataSource()
    }
    
}
