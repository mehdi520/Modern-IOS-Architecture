//
//  NetworkingManagerTests.swift
//  Modern-IOS-ArhitectureTests
//
//  Created by Apple on 9/16/23.
//

import XCTest
@testable import Modern_IOS_Arhitecture

final class MovieServiceTests: XCTestCase {

    func test_with_successfull_response_is_valid() async throws
    {
        let popularMoviesApi = MovieHttpRouter.getPopularMovies
        let movieService = MovieService.shared
        _ = try await movieService.getPopularMovies(success: {_ in }, failure: {_ in })
        
     
    }
    
    

}
