//
//  DOSViewController.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import UIKit

class DOSViewController: UIViewController {

	var presenter: DOSPresenterProtocol?
	
	@IBOutlet weak var doslabel: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()
		self.title = "DOS"
    }

}
