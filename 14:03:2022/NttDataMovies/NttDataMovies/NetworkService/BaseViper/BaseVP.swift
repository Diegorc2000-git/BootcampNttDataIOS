//
//  BaseVP.swift
//  NttDataMovies
//
//  Created by Diego Rodriguez Casillas on 14/3/22.
//

import Foundation

protocol BaseInteractorInputProtocol: AnyObject {}
protocol BaseInteractorOutputProtocol: AnyObject {}

class BasePresenter {
	internal var baseInteractor: BaseInteractorInputProtocol?
	required init() {}
}

class BaseInteractor {
	internal weak var basePresenter: BaseInteractorOutputProtocol?
	required init() {}
}

class BaseAssembly {
	static func assembly<Presenter: BasePresenter,
						 Interactor: BaseInteractor>(presenter: Presenter.Type,
													 interactor: Interactor.Type) -> (presenter: Presenter,
																					  intetactor: Interactor) {
		let basePresenter = Presenter()
		let baseInteractor = Interactor()
		basePresenter.baseInteractor = baseInteractor as? BaseInteractorInputProtocol
		baseInteractor.basePresenter = basePresenter as? BaseInteractorOutputProtocol
		return (basePresenter, baseInteractor)
	}
}
