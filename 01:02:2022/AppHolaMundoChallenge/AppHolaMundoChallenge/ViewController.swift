//
//  ViewController.swift
//  AppHolaMundoChallenge
//
//  Created by Diego Rodriguez Casillas on 1/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlet
	@IBOutlet var firstScreen: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var textModificable: UILabel!
	@IBOutlet weak var centerButton: UIButton!
	@IBOutlet weak var bottomButton: UIButton!
	
	var username: String = ""
	
	// MARK: - IBActions
	@IBAction func changeSubtitleLabel(_ sender: UIButton) {
		self.textModificable.text = "He cambiado este texto"
		self.textModificable.textColor = UIColor.black
	}
	
	@IBAction func resetTextLabel(_ sender: UIButton) {
		self.textModificable.text = "Este texto va a cambiar"
		self.textModificable.textColor = UIColor.red
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}

	func configureView() {
		self.firstScreen.backgroundColor = UIColor.lightGray
		
		self.titleLabel.text = "Esta es la primera Pagina"
		self.titleLabel.textColor = UIColor.black
		
		self.subtitleLabel.text = "Estamos En la pantalla de edición"
		self.subtitleLabel.textColor = UIColor.black
		
		self.textModificable.text = "Este texto va a cambiar"
		self.textModificable.textColor = UIColor.red

		self.centerButton.backgroundColor = UIColor.black
		self.centerButton.setTitleColor(UIColor.white, for: .normal)
		self.centerButton.setTitle("Cambiar texto", for: .normal)
		self.centerButton.layer.cornerRadius = 8
		
		self.bottomButton.backgroundColor = UIColor.black
		self.bottomButton.setTitleColor(UIColor.white, for: .normal)
		self.bottomButton.setTitle("Resetear texto", for: .normal)
		self.bottomButton.layer.cornerRadius = 8
	}

}
