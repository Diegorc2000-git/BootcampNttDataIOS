//
//  NewTaksCoordinator.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import Foundation
import UIKit

final class NewTaksCoordinator {
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> NewTaskViewController {
		let vc = NewTaskViewController()
		return vc
	}
//
//	static func presenter(vc: CarListViewController) -> CarListPresenterProtocol {
//		let presenter = CarListPresenter(vc: vc)
//		presenter.router = router(vc: vc)
//		return presenter
//	}
//
//	static func router(vc: CarListViewController) -> CarListRouterProtocol {
//		let router = CarListRouter(vc: vc)
//		return router
//	}
}
