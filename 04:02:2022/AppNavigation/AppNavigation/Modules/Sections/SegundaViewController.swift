//
//  SegundaViewController.swift
//  AppNavigation
//
//  Created by Diego Rodriguez Casillas on 4/2/22.
//

import UIKit

class SegundaViewController: UIViewController {
	
	// MARK: - variables
	var variable = GlobalUserData()
	var dogYear: Int?
	
	// MARK: - Outlets
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var surnameLabel: UILabel!
	@IBOutlet weak var phoneTextFile: UITextField!
	@IBOutlet weak var directionTextFile: UITextField!
	@IBOutlet weak var calculateDogAgeTextFile: UITextField!
	@IBOutlet weak var dogAgeLabel: UILabel!
	@IBOutlet weak var buttonCalculate: UIButton!
	
	@IBAction func calculateAgePressed(_ sender: Any) {
		dogYear = Int(calculateDogAgeTextFile.text ?? "")
		if let dogYearDes = dogYear {
			let newDogAge = dogYearDes * 7
			self.dogAgeLabel.text = "La edad de tu perro es: \(newDogAge)"
			dogAgeLabel.isHidden = false
		} else {
			present(displayAlertVC(myTitle: "Hey",
								   myMessage: "Tienes que rellenar todos los campos"),
					animated: true)
		}
	}
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		showInfo()
		dogAgeLabel.isHidden = true
    }
	
	func showInfo() {
		nameLabel.text = variable.nameData
		surnameLabel.text = variable.surnameData
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "segueV3" {
			if !(self.phoneTextFile.text?.isEmpty ?? false) && !(self.directionTextFile.text?.isEmpty ?? false) && !(self.calculateDogAgeTextFile.text?.isEmpty ?? false) {
				let vc3 = segue.destination as! TerceraViewController
				vc3.variable.nameData = self.nameLabel.text
				vc3.variable.surnameData = self.surnameLabel.text
				vc3.variable.phoneData = self.phoneTextFile.text
				vc3.variable.directionsData = self.directionTextFile.text
				vc3.variable.yearDogData = self.calculateDogAgeTextFile.text
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
