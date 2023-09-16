//
//  HomeModuleBuilder.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation

import UIKit

class HomeModuleBBuilder
{
    static func build(usingNavigationFactory factory: NavigationFactory ) -> UINavigationController
    {
        let view = HomeVC(nibName: "HomeVC", bundle: nil) as HomeVC
        view.modalPresentationStyle = .fullScreen
        let router = HomeRouter(view: view)
        let interactor = MovieInteractor.shared
        
        view.presenter = HomePresenter(view: view, router: router, useCase: (
            fetchPopularMovies: interactor.getPopularMovies,
            ()
        ))
        
        return factory(view)
    }
}
