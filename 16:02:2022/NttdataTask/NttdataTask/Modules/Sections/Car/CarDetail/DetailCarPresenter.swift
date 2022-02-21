//
//  DetailCarPresenter.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation

protocol DetailCarPresenterProtocol {
	func getDataModel()
	func informationData() -> ArrayCar?
}

final class DetailCarPresenter {
	
	var modelData: ArrayCar?
	let vc: DetailCarViewController?
	
	init(vc: DetailCarViewController) {
		self.vc = vc
	}
	
}

extension DetailCarPresenter: DetailCarPresenterProtocol {
	
	func getDataModel() {
		self.vc?.reloadDataModel()
	}
	
	func informationData() -> ArrayCar? {
		return modelData
	}
	
}
