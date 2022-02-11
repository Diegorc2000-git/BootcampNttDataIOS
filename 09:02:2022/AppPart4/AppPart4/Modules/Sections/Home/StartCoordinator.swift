//
//  StartCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation
import UIKit

final class StartCoordinator {

	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}

	static func view() -> StartViewController {
		let vc = StartViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}

	static func presenter(vc: StartViewController) -> StartPresenterProtocol {
		let presenter = StartPresenter(vc: vc)
		return presenter
	}

}
