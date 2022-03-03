//
//  BaseProtocols.swift
//  Formula 1
//
//  Created by Diego Rodriguez Casillas on 2/3/22.
//

import Foundation

//MARK: - View
protocol BaseViewProtocol: class {
	
}

extension BaseViewProtocol {
	
}

//MARK: - Presenter
protocol BasePresenterProtocol: class {
	func viewDidLoad()
	func backNavigationBarButtonPressed()
}

extension BasePresenterProtocol {
	
}

//MARK: - Interactor
protocol BaseInteractorInputProtocol: class {
	
}

extension BaseInteractorInputProtocol {

}

protocol BaseInteractorOutputProtocol: class {
	
}

extension BaseInteractorOutputProtocol {
	
}
//MARK: - Router
protocol BaseRouterProtocol: class {
	func backToPreviousScreen()
	func cancelFlow()
	func getNavigationType() -> BaseRouter.NavigationType?
}

extension BaseRouterProtocol {
	
}

protocol BaseRouterDelegate: class {
	func navigationDone()
}

extension BaseRouterDelegate {
	
}

//MARK: - Provider
protocol BaseProviderDelegate: class {
	
}
