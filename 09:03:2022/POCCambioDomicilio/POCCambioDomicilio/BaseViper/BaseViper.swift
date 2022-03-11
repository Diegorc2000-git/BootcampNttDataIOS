//
//  BaseViper.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation

// MARK: - Interface
public protocol RouterPresenterInterface: class {
	
}

public protocol InteractorPresenterInterface: class {
	
}

public protocol PresenterRouterInterface: class {
	
}

public protocol PresenterInteractorInterface: class {
	
}

public protocol PresenterViewInterface: class {
	
}

public protocol ViewPresenterInterface: class {
	
}

// MARK: - VIPER
public protocol RouterInterface: RouterPresenterInterface {
	associatedtype PresenterRouter
	
	var presenter: PresenterRouter! { get set }
	
}

public protocol InteractorInterface: InteractorPresenterInterface {
	associatedtype PresenterInteractor
	
	var presenter: PresenterInteractor! { get set }
	
}

public protocol PresenterInterface: PresenterRouterInterface & PresenterInteractorInterface & PresenterViewInterface {
	associatedtype RouterPresenter
	associatedtype InteractorPresenter
	associatedtype ViewPresenter

	
	var router: RouterPresenter! { get set }
	var interactor: InteractorPresenter! { get set }
	var view: ViewPresenter! { get set }
	
}

public protocol ViewInterface: ViewPresenterInterface {
	associatedtype PresenterView
	
	var presenter: PresenterView! { get set }
	
}

public protocol ModulesInterface {
	
	associatedtype View where View: ViewInterface
	associatedtype Presenter where Presenter: PresenterInterface
	associatedtype Router where Router: RouterInterface
	associatedtype Interactor where Interactor: InteractorInterface
	
	func coordinator(view: View, presenter: Presenter, router: Router, interactor: Interactor)

}

// MARK: - module
public extension ModulesInterface {
	
	func coordinator(view: View, presenter: Presenter, router: Router, interactor: Interactor) {
		view.presenter = (presenter as! Self.View.PresenterView)
		presenter.view = (view as! Self.Presenter.ViewPresenter)
		presenter.interactor = (interactor as! Self.Presenter.InteractorPresenter)
		presenter.router = (router as! Self.Presenter.RouterPresenter)
		interactor.presenter = (presenter as! Self.Interactor.PresenterInteractor)
		router.presenter = (presenter as! Self.Router.PresenterRouter)
	}
	
}
