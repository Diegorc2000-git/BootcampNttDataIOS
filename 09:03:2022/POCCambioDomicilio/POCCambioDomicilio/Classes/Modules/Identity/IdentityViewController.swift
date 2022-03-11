//
//  IdentityViewController.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

protocol IdentityViewPresenterInterface: ViewPresenterInterface {
	
}

class IdentityViewController: UIViewController, ViewInterface {

	var presenter: IdentityPresenterViewInterface!
	
	// MARK: - IBOutlet
	@IBOutlet weak var buttonInformation: UIButton!
	
	// MARK: - IBAction
	@IBAction func buttonInformationPressed(_ sender: Any) {
		self.presenter.buttonInformationPressed()
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

	}

}

extension IdentityViewController: IdentityViewPresenterInterface {
	
}
