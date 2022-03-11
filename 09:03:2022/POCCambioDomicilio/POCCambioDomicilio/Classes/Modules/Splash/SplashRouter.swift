//
//  SplashRouter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol SplashRouterPresenterInterface: RouterPresenterInterface {
	func navigateToLogin()
}

final class SplashRouter: RouterInterface {
	
	weak var presenter: SplashPresenterRouterInterface!
	weak var viewController: UIViewController?
	
}

extension SplashRouter: SplashRouterPresenterInterface {
	
	func navigateToLogin() {
		let viewController = LoginAssembly().build()
		viewController.modalTransitionStyle = .crossDissolve
		viewController.modalPresentationStyle = .fullScreen
		self.viewController?.present(viewController, animated: true, completion: nil)
		
	}
	
}
