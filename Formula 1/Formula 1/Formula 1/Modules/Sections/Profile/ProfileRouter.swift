//
//  ProfileRouter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

protocol ProfileRouterProtocol {
	
}

final class ProfileRouter {
	
	let vc: ProfileViewController?
	
	init(vc: ProfileViewController) {
		self.vc = vc
	}
}

extension ProfileRouter: ProfileRouterProtocol {
	
}
