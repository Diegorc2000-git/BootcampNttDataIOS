//
//  LoginCoordinator.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 9/2/22.
//

import Foundation
import UIKit

final class LoginCoordinator {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view() -> LoginViewController {
		let vc = LoginViewController()
		vc.presenter = presenter(vc: vc)
		return vc
	}
	
	static func presenter(vc: LoginViewController) -> LoginPresenterProtocol {
		let presenter = LoginPresenter(vc: vc)
		return presenter
	}
	
}
