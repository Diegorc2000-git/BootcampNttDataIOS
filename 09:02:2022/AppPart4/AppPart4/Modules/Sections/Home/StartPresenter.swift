//
//  StartPresenter.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import Foundation
import UIKit

protocol StartPresenterProtocol {
	
}

final class StartPresenter {
	
	let vc: StartViewController?
	
	init(vc: StartViewController) {
		self.vc = vc
	}
	
}

extension StartPresenter: StartPresenterProtocol {
	
}
