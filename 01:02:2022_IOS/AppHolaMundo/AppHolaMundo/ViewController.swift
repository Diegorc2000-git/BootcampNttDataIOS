//
//  ViewController.swift
//  AppHolaMundo
//
//  Created by Diego Rodriguez Casillas on 1/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlet
	@IBOutlet weak var holaMundoLabel: UILabel!
	@IBOutlet weak var saludosAlSolLabel: UILabel!
	@IBOutlet weak var consTrailingPrimerLabel: NSLayoutConstraint!
	
	// MARK: - IBActions
	@IBAction func cambiaNombreAction(_ sender: UIButton) {
		self.holaMundoLabel.text = "Hola BootCamp iOs NttData"
		self.saludosAlSolLabel.text = "Hola Sol y Luna"
		consTrailingPrimerLabel.constant = 50
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("Aqui estamos currando a tope")
	}


}

