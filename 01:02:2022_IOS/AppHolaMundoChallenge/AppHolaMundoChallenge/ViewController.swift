//
//  ViewController.swift
//  AppHolaMundoChallenge
//
//  Created by Diego Rodriguez Casillas on 1/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlet
	
	// MARK: - Fisrt Screen
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var subtitleLabel: UILabel!
	@IBOutlet weak var textModificable: UILabel!
	@IBOutlet weak var centerButton: UIButton!
	
	// MARK: - IBActions
	@IBAction func changeSubtitleLabel(_ sender: UIButton) {
		self.textModificable.text = "He cambiado este texto"
	}
	
	// MARK: - Second Screen

	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}

	func configureView() {
		self.titleLabel.text = "Esta es la primera Pagina"
		self.titleLabel.textColor = UIColor.blue
		
		self.subtitleLabel.text = "Estamos En la pantalla de edición"
		self.subtitleLabel.textColor = UIColor.brown
		
		self.textModificable.text = "Este texto va a cambiar"
		
		self.centerButton.backgroundColor = UIColor.black
		self.centerButton.layer.cornerRadius = 5
	}

}

