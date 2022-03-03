//
//  HomeRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 1/3/22.
//

import Foundation

protocol HomeRouterProtocol: BaseRouterProtocol {
	func navigateToMoreInformation()
}

final class HomeRouter: BaseRouter {
	
	private weak var view: HomeViewController? { return super.baseView as? HomeViewController }
	
}

extension HomeRouter: HomeRouterProtocol {
	func navigateToMoreInformation() {
		print("ESTO ES LA OSTIA")
	}
	
}
