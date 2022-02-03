//
//  ViewController2.swift
//  AppHolaMundoChallenge
//
//  Created by Diego Rodriguez Casillas on 1/2/22.
//

import UIKit

class ViewController2: UIViewController {
	// MARK: - IBOutlet
	@IBOutlet var viewScreen2: UIView!
	@IBOutlet weak var imageView2: UIImageView!
	@IBOutlet weak var imageView4: UIImageView!
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	@IBOutlet weak var heightContraint: NSLayoutConstraint!
	
	// MARK: - IBActions
	@IBAction func changeImage4(_ sender: UIButton) {
		imageView4.image = UIImage(named: "Rivian")
	}
	
	@IBAction func hideImage2(_ sender: UIButton) {
		imageView2.isHidden = true
		heightContraint.constant = 0
	}
	
	@IBAction func reset(_ sender: UIButton) {
		imageView4.image = UIImage(named: "Raptor")
		imageView2.isHidden = false
		heightContraint.constant = 128
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		configureView()
	}

	func configureView() {
		self.viewScreen2.backgroundColor = UIColor.lightGray
		self.button1.setTitle("Cambiar Ford Raptor", for: .normal)
		self.button1.layer.cornerRadius = 8
		self.button1.backgroundColor = UIColor.gray
		self.button1.setTitleColor(UIColor.black, for: .normal)
		
		self.button2.setTitle("Ocultar Jeep Gladiator", for: .normal)
		self.button2.layer.cornerRadius = 8
		self.button2.backgroundColor = UIColor.gray
		self.button2.setTitleColor(UIColor.black, for: .normal)
		
		self.button3.setTitle("Resetear Todo", for: .normal)
		self.button3.layer.cornerRadius = 8
		self.button3.backgroundColor = UIColor.gray
		self.button3.setTitleColor(UIColor.black, for: .normal)
	}
	
}
