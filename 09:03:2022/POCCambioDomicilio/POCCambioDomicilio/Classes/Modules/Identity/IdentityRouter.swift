//
//  IdentityRouter.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import Foundation
import UIKit

protocol IdentityRouterPresenterInterface: RouterPresenterInterface {
	func showMessageMoreInfoProfile()
}

final class IdentityRouter: RouterInterface {
	
	
	weak var presenter: IdentityPresenterRouterInterface!
	weak var viewController: UIViewController?
}

extension IdentityRouter: IdentityRouterPresenterInterface {
	func showMessageMoreInfoProfile() {
		let dto = MessageAssemblyDTO(titulo: "Mas Información",
								 contenido: "Una vez realizado un nuevo empadronamiento, aqui podrás comunicar a los distintos organismos de la administración (como Direccion general de tráfico, agencia trobitaria y Seguridad social entre otros), tu cambio de domicilio sin tener que realizarlo presencialmente en cada uno de ellos. \n\n En el caso de no aparecer la información correcta del ultimo empadronamiento realizado deberás ponerte en contacto con tu oficina de empadronamiento",
								 botones: true)
		let vc = MessageAssembly().build(dto: dto)
		vc.modalPresentationStyle = .overCurrentContext
		self.viewController?.present(vc, animated: false, completion: nil)
	}
}
