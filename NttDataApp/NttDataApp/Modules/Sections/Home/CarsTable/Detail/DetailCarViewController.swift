//
//  DetailCarViewController.swift
//  NttDataApp
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import UIKit

class DetailCarViewController: UIViewController {

	var carName = ""
	
	@IBOutlet weak var label: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		self.label.text = carName
    }

}
