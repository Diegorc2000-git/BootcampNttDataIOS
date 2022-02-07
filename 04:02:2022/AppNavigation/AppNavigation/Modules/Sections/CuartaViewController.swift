//
//  CuartaViewController.swift
//  AppNavigation
//
//  Created by Diego Rodriguez Casillas on 4/2/22.
//

import UIKit

class CuartaViewController: UIViewController {

	// MARK: - variables
	var variable = GlobalUserData()
	
	// MARK: - Outlets
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var surnameLabel: UILabel!
	@IBOutlet weak var mobileLabel: UILabel!
	@IBOutlet weak var directionLabel: UILabel!
	@IBOutlet weak var dogYearLabel: UILabel!
	@IBOutlet weak var codPostalLabel: UILabel!
	@IBOutlet weak var cityLabel: UILabel!
	@IBOutlet weak var geograficalPositionLabel: UILabel!
	
	// MARK: - Outlets Actions
	
	
    override func viewDidLoad() {
        super.viewDidLoad()

        showInfo()
    }

	func showInfo() {
		nameLabel.text = variable.nameData
		surnameLabel.text = variable.surnameData
		mobileLabel.text = variable.phoneData
		directionLabel.text = variable.directionsData
		dogYearLabel.text = variable.yearDogData
		codPostalLabel.text = variable.cpData
		cityLabel.text = variable.countryData
		geograficalPositionLabel.text = variable.geograficalPositionData
	}
}
