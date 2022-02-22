//
//  ListTaskPresenter.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 22/2/22.
//

import Foundation

protocol ListTaskPresenterProtocol {
	func viewDidLoadInPresent()
}

final class ListTaskPresenter {
	
	// MARK: - Variables
	let vc: ListTaskViewController?
	var downloads: [DownloadNewModel]?
	
	init(vc: ListTaskViewController) {
		self.vc = vc
	}
	
}

extension ListTaskPresenter: ListTaskPresenterProtocol {
	func viewDidLoadInPresent() {
		self.vc?.reloadDataInView()
	}
	
	
}
