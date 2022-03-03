//
//  ProfilePresenter.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation
import UIKit

protocol ProfilePresenterProtocol {
	
}

final class ProfilePresenter {
	
	let vc: ProfileViewController?
	var router: ProfileRouterProtocol?
	
	init(vc: ProfileViewController) {
		self.vc = vc
	}
	
}

extension ProfilePresenter: ProfilePresenterProtocol {
	
}
