//
//  DetailCoordinator.swift
//  AppIntroTableView
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import Foundation
import UIKit

final class DetailCoordinator {
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view(dto: DetailCoordinatorDTO? = nil) -> DetailViewController {
		let vc = DetailViewController()
		vc.nameMonth = dto?.nameMonth ?? ""
		return vc
	}
}

struct DetailCoordinatorDTO {
	var nameMonth: String?
	
}
