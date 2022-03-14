//
//  MoviesPresenter.swift
//  NttDataMovies
//
//  Created by Diego Rodriguez Casillas on 14/3/22.
//

import Foundation

protocol MoviesInteractorOutputProtocol: BaseInteractorOutputProtocol {
	func getDataFromInteractor(data: MoviesBussinesModel)
}

final class MoviesPresenter: BasePresenter, ObservableObject {
	
	// ID
	var interactor: MoviesInteractorInputProtocol? {
		super.baseInteractor as? MoviesInteractorInputProtocol
	}
	
	// Publishers
	@Published var arrayMovies: [ResultViewModel] = []
	
	func fetchDataFromItunes() {
		self.interactor?.fetchDataFromItunes(top: "top-movies",
											 all: "all",
											 number: "25")
	}
	
}

extension MoviesPresenter: MoviesInteractorOutputProtocol {
	func getDataFromInteractor(data: MoviesBussinesModel) {
		self.arrayMovies.removeAll()
		self.arrayMovies = data.results ?? []
	}
}
