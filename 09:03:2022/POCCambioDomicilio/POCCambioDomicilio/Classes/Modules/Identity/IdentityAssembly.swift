//
//  IdentityAssembly.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

// MARK: - module builder

final class IdentityAssembly: ModulesInterface {

	typealias View = IdentityViewController
	typealias Presenter = IdentityPresenter
	typealias Router = IdentityRouter
	typealias Interactor = IdentityInteractor
	
	func navigation() -> UINavigationController {
		UINavigationController(rootViewController: build())
		
	}

	func build() -> UIViewController {
		let view = View()
		let interactor = Interactor()
		let presenter = Presenter()
		let router = Router()
		self.coordinator(view: view, presenter: presenter, router: router, interactor: interactor)
		router.viewController = view
		return view
	}
}
