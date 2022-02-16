//
//  CarListRouter.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation

protocol CarListRouterProtocol {
	func showDetail(dto: ArrayCar)
}

final class CarListRouter {
	
	let vc: CarListViewController?
	
	init(vc: CarListViewController) {
		self.vc = vc
	}
	
}

extension CarListRouter: CarListRouterProtocol {
	
	func showDetail(dto: ArrayCar) {
		DispatchQueue.main.async {
			let vc = CarDetailCoordinator.view(dto: CarDetailCoordinatorDTO(modelData: dto))
			self.vc?.navigationController?.pushViewController(vc, animated: true)
		}
	}
	
}
