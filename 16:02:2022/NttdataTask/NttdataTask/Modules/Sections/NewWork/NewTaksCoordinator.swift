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
		vc.presenter = presenter(vc: vc)
		return vc
	}

	static func presenter(vc: NewTaskViewController) -> NewTaskPresenterProtocol {
		let presenter = NewTaskPresenter(vc: vc)
		presenter.router = router(vc: vc)
		return presenter
	}

	static func router(vc: NewTaskViewController) -> NewTaskRouterProtocol {
		let router = NewTaskRouter(vc: vc)
		return router
	}
}
