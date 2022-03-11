//
//  LoginAssembly.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

// MARK: - module builder

final class LoginAssembly: ModulesInterface {

	typealias View = LoginViewController
	typealias Presenter = LoginPresenter
	typealias Router = LoginRouter
	typealias Interactor = LoginInteractor
	
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

struct LoginAssemblyDTO {
	
}
