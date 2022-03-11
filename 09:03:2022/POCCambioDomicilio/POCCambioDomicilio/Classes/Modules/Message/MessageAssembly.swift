//
//  MessageAssembly.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

// MARK: - module builder

final class MessageAssembly: ModulesInterface {

	typealias View = MessageViewController
	typealias Presenter = MessagePresenter
	typealias Router = MessageRouter
	typealias Interactor = MessageInteractor
	
	func navigation(dto: MessageAssemblyDTO? = nil) -> UINavigationController {
		UINavigationController(rootViewController: build(dto: dto))
	}

	func build(dto: MessageAssemblyDTO? = nil) -> UIViewController {
		let view = View()
		let interactor = Interactor()
		let presenter = Presenter()
		let router = Router()
		self.coordinator(view: view, presenter: presenter, router: router, interactor: interactor)
		router.viewController = view
		return view
	}
}

struct MessageAssemblyDTO {
	let titulo: String?
	let contenido: String?
	let botones: Bool?
	
	init(titulo: String?, contenido: String?, botones: Bool) {
		self.titulo = titulo
		self.contenido = contenido
		self.botones = botones
	}
}
