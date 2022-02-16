//
//  CarDetailCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation

final class CarDetailCoordinator {
	
	static func view(dto: CarDetailCoordinatorDTO? = nil) -> DetailCarViewController {
		let vc = DetailCarViewController()
		vc.presenter = presenter(vc: vc, dto: dto)
		return vc
	}
	
	static func presenter(vc: DetailCarViewController, dto: CarDetailCoordinatorDTO? = nil) -> DetailCarPresenterProtocol {
		let presenter = DetailCarPresenter(vc: vc)
		presenter.modelData = dto?.modelData
		return presenter
	}
	
}

struct CarDetailCoordinatorDTO {
	var modelData: ArrayCar?
}
