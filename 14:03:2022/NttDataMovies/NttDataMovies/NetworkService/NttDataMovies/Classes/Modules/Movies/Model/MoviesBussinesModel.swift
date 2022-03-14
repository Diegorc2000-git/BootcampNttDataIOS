//
//  MoviesBussinesModel.swift
//  NttDataMovies
//
//  Created by Diego Rodriguez Casillas on 14/3/22.
//

import Foundation

struct MoviesBussinesModel {
	let results: [ResultViewModel]?
}

struct ResultViewModel: Identifiable {
	let artistName: String?
	let id: String?
	let name: String?
	let artworkUrl100: String?
	let url: String?
}
