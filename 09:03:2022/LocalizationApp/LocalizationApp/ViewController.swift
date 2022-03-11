//
//  ViewController.swift
//  LocalizationApp
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - OUtlets
	@IBOutlet weak var greatingLabel1: UILabel!
	@IBOutlet weak var greatingLabel2: UILabel!
	@IBOutlet weak var greatingLabel3: UILabel!
	@IBOutlet weak var greatingLabel4: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.greatingLabel1.text = LocalizedKeys.General.generalGreetingMorning.localized
		self.greatingLabel2.text = LocalizedKeys.General.generalGreatingNight.localized
		self.greatingLabel3.text = LocalizedKeys.General.generalGreatingEvening.localized
		self.greatingLabel4.text = LocalizedKeys.General.generalGreating.localized
		
	}

}

extension String {
	var localized: String {
		return NSLocalizedString(self, comment: "")
	}
}
