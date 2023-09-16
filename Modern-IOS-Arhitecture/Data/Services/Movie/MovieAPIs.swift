//
//  MovieAPIs.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
protocol MovieAPIs {
    func getPopularMovies(
                success: @escaping (_ message: MovieResModel) -> Void,
                failure: @escaping (_ error: String) -> Void
                )
   
}
