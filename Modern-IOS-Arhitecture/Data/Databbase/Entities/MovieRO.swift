//
//  MovieRO.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import RealmSwift

class MovieRO: Object{
    
    @objc dynamic var id : Int
    @objc dynamic var title : String?
    @objc dynamic var overview : String?
    @objc dynamic var popularity : Double
    @objc dynamic var poster_path : String?
    @objc dynamic var release_date : String?
    @objc dynamic var vote_count : Int
    
    override static func primaryKey()->String{
           return "id"
       }
    override init() {
        self.id = 0
        self.popularity = 0
        self.vote_count = 0
    }
    init(id: Int, title: String? = nil, overview: String? = nil, popularity: Double, poster_path: String? = nil, release_date: String? = nil, vote_count: Int) {
        self.id = id
        self.title = title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.vote_count = vote_count
    }
    

}
extension MovieRO{
    
    convenience init(movie : MovieModel) {
            self.init()
            self.id = movie.id
            self.title = movie.title
            self.overview = movie.overview
            self.popularity = movie.popularity ?? 0
            self.poster_path = movie.poster_path
            self.release_date = movie.release_date
            self.vote_count = movie.vote_count ?? 0
    }
}
