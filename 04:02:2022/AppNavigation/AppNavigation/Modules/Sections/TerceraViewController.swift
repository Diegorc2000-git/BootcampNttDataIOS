//
//  TerceraViewController.swift
//  AppNavigation
//
//  Created by Diego Rodriguez Casillas on 4/2/22.
//

import UIKit

class TerceraViewController: UIViewController {

	// MARK: - variables
	var variable = GlobalUserData()
	
	// MARK: - Outlets
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var surnameLabel: UILabel!
	@IBOutlet weak var phoneLabel: UILabel!
	@IBOutlet weak var directionLabel: UILabel!
	@IBOutlet weak var dogAgeLabel: UILabel!
	
	@IBOutlet weak var codPostalTextField: UITextField!
	@IBOutlet weak var cityTextField: UITextField!
	@IBOutlet weak var geograficalPositionTextField: UITextField!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		showInfo()
    }
	
	func showInfo() {
		nameLabel.text = variable.nameData
		surnameLabel.text = variable.surnameData
		phoneLabel.text = variable.phoneData
		directionLabel.text = variable.directionsData
		dogAgeLabel.text = variable.yearDogData
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueV4" {
			if !(self.codPostalTextField.text?.isEmpty ?? false) && !(self.cityTextField.text?.isEmpty ?? false) && !(self.geograficalPositionTextField.text?.isEmpty ?? false) {
				let vc4 = segue.destination as! CuartaViewController
				vc4.variable.nameData = self.nameLabel.text
				vc4.variable.surnameData = self.surnameLabel.text
				vc4.variable.phoneData = self.phoneLabel.text
				vc4.variable.directionsData = self.directionLabel.text
				vc4.variable.yearDogData = self.dogAgeLabel.text
				vc4.variable.cpData = self.codPostalTextField.text
				vc4.variable.countryData = self.cityTextField.text
				vc4.variable.geograficalPositionData = self.geograficalPositionTextField.text
			} else {
				present(displayAlertVC(myTitle: "Hey",
									   myMessage: "Tienes que rellenar todos los campos"),
						animated: true,
						completion: nil)
			}
		}
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

}
