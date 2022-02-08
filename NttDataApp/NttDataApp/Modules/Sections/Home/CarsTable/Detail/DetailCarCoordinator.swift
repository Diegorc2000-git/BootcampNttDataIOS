//
//  DetailCarCoordinator.swift
//  NttDataApp
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import Foundation
import UIKit

final class DetailCarCoordinator {
	
	static func navigation() -> UINavigationController {
		UINavigationController(rootViewController: view())
	}
	
	static func view(dto: DetailCarCoordinatorDTO? = nil) -> DetailCarViewController {
		let vc = DetailCarViewController()
		vc.carName = dto?.carName ?? ""
		return vc
	}
}

struct DetailCarCoordinatorDTO {
	var carName: String?
}
