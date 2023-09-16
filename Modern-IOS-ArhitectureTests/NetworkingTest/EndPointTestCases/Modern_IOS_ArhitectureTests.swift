//
//  Modern_IOS_ArhitectureTests.swift
//  Modern-IOS-ArhitectureTests
//
//  Created by Apple on 9/16/23.
//

import XCTest
@testable import Modern_IOS_Arhitecture

final class Modern_IOS_ArhitectureTests: XCTestCase {

  
    // MARK: - Test case Popular Movies end Point
    func test_with_popular_movies_endpoint_request_is_valid()
    {
        let popularMoviesApi = MovieHttpRouter.getPopularMovies
        XCTAssertEqual(popularMoviesApi.path, "3/movie/popular" , "The endpoint is not correct")
        XCTAssertEqual(popularMoviesApi.baseUrlString, "https://api.themoviedb.org/" , "The base url is not correct")
        XCTAssertEqual(popularMoviesApi.method, .get, "The method is not correct")

    }

}
