//
//  RealmDb.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import RealmSwift

class RealmDb{
  
    static let shared : RealmDb = RealmDb()
    private init() {}
    
    deinit {
    }
}
// MARK: - Movie
extension RealmDb : MovieDAO
{
    
    func saveMovies(movies: [MovieModel]) -> (Bool) {
        do
        {
            let realm = try! Realm()
        for item in movies
        {
            try realm.write {
                realm.add(MovieRO(movie: item),update: .all)
            }
        }
        }
        catch
        {
                return false
        }
        
        return true
    }
    
    func getMovies() -> [MovieModel] {
        var movies: [MovieModel] = []
        let realm = try! Realm()
        let realmObject = realm.objects(MovieRO.self)
      
        for item in realmObject
        {
            movies.append(MovieModel(movRO: item))
        }
        return movies
    }
    
}
