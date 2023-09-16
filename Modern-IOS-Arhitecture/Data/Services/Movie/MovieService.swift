//
//  MovieService.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation

class MovieService {
    private lazy var httpService = MovieHttpService()

    static let shared : MovieService = MovieService()
    private init() {}
}

extension MovieService: MovieAPIs {
    func getPopularMovies(success: @escaping (MovieResModel) -> Void, failure: @escaping (String) -> Void) {
        do {
            try MovieHttpRouter.getPopularMovies
                .request(usingHttpService: httpService)
                .responseJSON { (response) in
                    print("status code: \(String(describing: response.response?.statusCode))")
//                    print("Request body: \(String(data: (response.request?.httpBody)!, encoding: .utf8) as String?)")
                    print("Request url: \(String(describing : response.request?.url))")
                    print("Response:\(String(describing :  response))")
                    if response.response?.statusCode == 200 {
                        
                        do {
                            let decoder = JSONDecoder()
                            let res = try decoder.decode(MovieResModel.self, from:response.data! )
                                success(res)
                            if(res.results?.count ?? 0 > 0 )
                            {
                                let status = RealmDb.shared.saveMovies(movies: res.results!)

                            }
                        }
                        catch {
                            print("  failed = \(error)")
                            failure("Something went wrong")
                        }
                        
                      
                        return
                    }
                    else
                    {
                        let movies = RealmDb.shared.getMovies()
                        let movieLocaldata = MovieResModel(movies: movies)
                        success(movieLocaldata)
                    }
                    
      
                }
        } catch {
            print(" in failed = \(error)")
            let movies = RealmDb.shared.getMovies()
            let movieLocaldata = MovieResModel(movies: movies)
            success(movieLocaldata)
        }
    }
    
    

}
