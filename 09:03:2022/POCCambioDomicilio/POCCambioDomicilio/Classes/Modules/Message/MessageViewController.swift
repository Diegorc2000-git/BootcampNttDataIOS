//
//  MessageViewController.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

protocol MessageViewPresenterInterface: ViewPresenterInterface {
	
}

class MessageViewController: UIViewController, ViewInterface {

	var presenter: MessagePresenterViewInterface!
	
	// MARK: - IBOutlet
	@IBOutlet weak var viewContainer: UIView!
	@IBOutlet weak var titleInformation: UILabel!
	@IBOutlet weak var buttonClose: UIButton!
	@IBOutlet weak var descriptionInformation: UILabel!
	
	// MARK: - IBAction
	@IBAction func buttonClosePressed(_ sender: Any) {
		self.presenter.closeButtonPressed()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}

	func setupView() {
		self.viewContainer.layer.cornerRadius = 20
		
		self.titleInformation.text = "Info"
		self.titleInformation.textColor = CustomColor.color1.uiColor
		
		self.descriptionInformation.text = "Una vez realizado un nuevo empadronamiento, aqui podrás comunicar a los distintos organismos de la administración (como Dirección general de tráfico, agencia tributaria y Seguridad social entre otros), tu cambio de domicilio sin tener que realizarlo presencialmente en cada uno de ellos. \n\n En el caso de no aparecer la información correcta del último empadronamiento realizado deberás ponerte en contacto con tu oficina de empadronamiento."
		
	}
	
}

extension MessageViewController: MessageViewPresenterInterface {
	
}
