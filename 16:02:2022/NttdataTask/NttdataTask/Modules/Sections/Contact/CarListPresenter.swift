//
//  CarListPresenter.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation

protocol CarListPresenterProtocol {
	func viewDidLoadInPresent()
	func numberOfRowInSection() -> Int
	func informationCell(indexPath: Int) -> ArrayCar
	func showDetailCar(dto: ArrayCar)
}

final class CarListPresenter {
	
	// MARK: - Variables
	var arrayCars: [ArrayCar] = []
	let vc: CarListViewController?
	var router: CarListRouterProtocol?
	
	init(vc: CarListViewController) {
		self.vc = vc
	}
	
	
}

extension CarListPresenter: CarListPresenterProtocol {
	
	func viewDidLoadInPresent() {
		if let model = CarsModel.stubbedCars {
			self.arrayCars = model
			self.vc?.reloadDataInView()
		}
	}
	
	func numberOfRowInSection() -> Int {
		return self.arrayCars.count
	}
	
	func informationCell(indexPath: Int) -> ArrayCar {
		return arrayCars[indexPath]
	}
	
	func showDetailCar(dto: ArrayCar) {
		self.router?.showDetail(dto: dto)
	}
	
}
