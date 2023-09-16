//
//  HomeRouter.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import UIKit

protocol HomeRouting {
    func routeToMovieDetail(movie : MovieModel)
}

class HomeRouter
{
    var view : UIViewController?
    
    init(view:UIViewController) {
        self.view = view
    }
}

extension HomeRouter : HomeRouting
{
    func routeToMovieDetail(movie : MovieModel) {
        let vc = MovieDetailModuleBuilder.build(movie: movie)
        vc.modalPresentationStyle = .fullScreen
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
