//
//  HomePresenter.swift
//  Modern-IOS-Arhitecture
//
//  Created by Apple on 9/16/23.
//

import Foundation

protocol HomePresentation {
    func viewDidLoad()
    func routeToMovieDetail(movie : MovieModel)
}

class HomePresenter
{
    weak var view : HomeView?
    var router : HomeRouting?
    typealias UseCase = (
        fetchPopularMovies: (_ completion: @escaping (MovieResult<MovieResModel>)->Void)-> Void,
        ()
    )
    
    var useCase : UseCase
 
    init(view : HomeView?,router:HomeRouting , useCase : UseCase ) {
        self.router = router
        self.view = view
        self.useCase = useCase
    }
}
extension  HomePresenter : HomePresentation
{
    func viewDidLoad() {
        getPopularMovies()
    }
    
    func routeToMovieDetail(movie : MovieModel) {
        self.router?.routeToMovieDetail(movie: movie)
    }
    
    func getPopularMovies() -> () {
        self.view?.updateProgress(message: "", isCompleted: false)
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let `self` = self else { return }
            self.useCase.fetchPopularMovies() { response in
                DispatchQueue.main.async {
                    switch(response) {
                    case .success(let response):
                        self.view?.updateStatus(data: response.results ?? [],status: true, msg: "" , identifier: 1)

                    case .failure(let error):
                        self.view?.updateStatus(data: [], status: false, msg: error, identifier: 1)
                    }
                    self.view?.updateProgress(message: "", isCompleted: true)

                }
            }
        }
    }

}
