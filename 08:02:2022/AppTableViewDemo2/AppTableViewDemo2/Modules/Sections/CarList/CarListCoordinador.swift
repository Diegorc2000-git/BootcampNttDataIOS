//
//  CarListCoordinador.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import Foundation
import UIKit

final class CarListCoordinador {
	
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
		return presenter
	}
	
}
