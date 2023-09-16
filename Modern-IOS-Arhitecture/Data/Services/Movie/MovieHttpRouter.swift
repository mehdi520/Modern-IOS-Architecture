//
//  MovieRouter.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import Alamofire

enum MovieHttpRouter
{
    case getPopularMovies
  
}
extension MovieHttpRouter : HttpRouter
{
   
    
    var baseUrlString: String {
        return Config.API_BASE
    }
    
    var path: String {
        switch (self) {
        case .getPopularMovies:
            return Config.getPopularMoviesEndPoint
        }
    }
    
    var method: HTTPMethod {
        switch (self) {
        case .getPopularMovies:
            return .get
          
         
           }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Authorization" : "Bearer " + Config.acessToken ,
                       "Content-Type": "application/json; charset=UTF-8"
                   ]
    }
    
    var parameters: Parameters? {
        switch self {
     
        case .getPopularMovies:
            return nil;
        }
    }
    
    var bodyParams: Parameters? {
        return nil
    }
    
}
