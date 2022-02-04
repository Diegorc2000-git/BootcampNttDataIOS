//
//  ViewController.swift
//  AppNavigation
//
//  Created by Diego Rodriguez Casillas on 4/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var surnameTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	//Ocultar teclado
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true) //cuando tocas fuera del teclado te lo oculta
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueV2" {
			if !(self.nameTextField.text?.isEmpty ?? false) && !(self.surnameTextField.text?.isEmpty ?? false) {
				let vc2 = segue.destination as! SegundaViewController
				vc2.variable.nameData = self.nameTextField.text
				vc2.variable.surnameData = self.surnameTextField.text
				
			} else {
				present(displayAlertVC(myTitle: "Hey",
									   myMessage: "Tienes que rellenar los campos"),
						animated: true,
						completion: nil)
			}
		}
	}

}

