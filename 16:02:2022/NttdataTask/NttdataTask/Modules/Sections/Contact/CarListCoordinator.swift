//
//  CarListCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import Foundation
import UIKit

final class CarListCoordinator {
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> CarListViewController {
		let vc = CarListViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: CarListViewController) -> CarListPresenterProtocol {
		let presenter = CarListPresenter(vc: vc)
		presenter.router = router(vc: vc)
		return presenter
	}
	
	static func router(vc: CarListViewController) -> CarListRouterProtocol {
		let router = CarListRouter(vc: vc)
		return router
	}
}
