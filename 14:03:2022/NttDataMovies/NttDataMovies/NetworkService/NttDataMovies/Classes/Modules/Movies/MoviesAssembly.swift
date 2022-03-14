//
//  MoviesAssembly.swift
//  NttDataMovies
//
//  Created by Diego Rodriguez Casillas on 14/3/22.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: BaseAssembly {
	
	typealias ContentView = MoviesView
	typealias Presenter = MoviesPresenter
	typealias Interactor = MoviesInteractor
	
	static func navigation(dto: MoviesCoordinatorDTO? = nil) -> NavigationView<ContentView> {
		NavigationView{
			self.view()
		}
	}
	
	static func view(dto: MoviesCoordinatorDTO? = nil) -> ContentView {
		let vip = BaseAssembly.assembly(presenter: Presenter.self,
										   interactor: Interactor.self)
		let view = ContentView(presenter: vip.presenter)
		return view
	}
}

struct MoviesCoordinatorDTO {
	
}
