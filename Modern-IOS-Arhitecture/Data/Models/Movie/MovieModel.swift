//
//  MovieModel.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation

struct MovieModel : Codable {
    var id : Int
    var title : String?
    var overview : String?
    var popularity : Double?
    var poster_path : String?
    var release_date : String?
    var vote_count : Int?
    
    init()  {
     id = 0
    }
}
extension MovieModel {
    init(movRO : MovieRO) {
     
           self.id = movRO.id
           self.title = movRO.title
           self.overview = movRO.overview
           self.popularity = movRO.popularity
           self.poster_path = movRO.poster_path
           self.release_date = movRO.release_date
           self.vote_count = movRO.vote_count
        
   }
}

struct MovieResModel : Codable {
    let results : [MovieModel]?
    
    init(movies : [MovieModel]) {
        self.results = movies
    }
}
