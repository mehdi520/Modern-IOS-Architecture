//
//  MovieIntractor.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation

enum MovieResult<T> {
    case success(result: T)
    case failure(error: String)
}
class MovieInteractor{
    static let shared : MovieInteractor = MovieInteractor(moviApi: MovieService.shared)
    
    private var moviApi: MovieAPIs
    
    private init(moviApi: MovieAPIs) {
        self.moviApi = moviApi
      
    }
}
extension MovieInteractor
{
    func getPopularMovies(completion : @escaping (MovieResult<MovieResModel>)-> Void){
        self.moviApi.getPopularMovies(    success: { res in
            completion(.success(result: res ))
        },
        failure: { error in
            completion(.failure(error: error))
    })
    }
  
}

