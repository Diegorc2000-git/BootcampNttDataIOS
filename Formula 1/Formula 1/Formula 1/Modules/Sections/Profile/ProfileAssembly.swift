//
//  ProfileAssembly.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

final class ProfileAssembly {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> ProfileViewController {
		let vc = ProfileViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: ProfileViewController) -> ProfilePresenterProtocol {
		let presenter = ProfilePresenter(vc: vc)
		presenter.router = router(vc: vc)
		return presenter
	}
	
	static func router(vc: ProfileViewController) -> ProfileRouterProtocol {
		let router = ProfileRouter(vc: vc)
		return router
	}
}
