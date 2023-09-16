//
//  MovieDAO.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation

import RealmSwift

protocol MovieDAO {
    
    func saveMovies(movies: [MovieModel]) -> (Bool)
    func getMovies()-> [MovieModel]
}
