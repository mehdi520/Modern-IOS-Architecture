//
//  MovieDetailModuleBuilder.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation
import UIKit

class MovieDetailModuleBuilder
{
    static func build(movie : MovieModel) -> UIViewController
    {
        let view = MovieDetailVC(nibName: "MovieDetailVC", bundle: nil) as MovieDetailVC
        view.movie = movie
//
//        let router = FavtRouter(view: view)
//        let interactor = Tripinteractor.shared
//
//        let presenter = FavtPresenter(view: view, router: router, useCase: (
//            fetchfavt: interactor.getFavtTrips,
//            ()
//        ))
//
//        presenter.view = view
//        view.presenter = presenter
        return view
        

    }
}
