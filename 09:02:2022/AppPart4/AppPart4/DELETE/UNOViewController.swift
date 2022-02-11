//
//  UNOViewController.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import UIKit

class UNOViewController: UIViewController {

	var presenter: UNOPresenterProtocol?
	
	@IBOutlet weak var unoLabel: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "UNO"
    }

}
