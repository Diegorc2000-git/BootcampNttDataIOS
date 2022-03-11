//
//  LoginViewController.swift
//  POCCambioDomicilio
//
//  Created by Diego Rodriguez Casillas on 9/3/22.
//

import UIKit

protocol LoginViewPresenterInterface: ViewPresenterInterface {
	
}

class LoginViewController: UIViewController, ViewInterface {

	// MARK: - IBOutlet
	@IBOutlet weak var topView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var iconImage: UIImageView!
	@IBOutlet weak var switchOption: UISwitch!
	@IBOutlet weak var switchLabel: UILabel!
	@IBOutlet weak var buttonAccess: UIButton!
	@IBOutlet weak var questionLabel: UILabel!
	
	// MARK: - IBActions
	@IBAction func switchPressed(_ sender: UISwitch) {
		
		let switchStatus: Bool = sender.isOn
		
		if switchStatus {
			switchOption.setOn(false, animated: false)
		} else {
			switchOption.setOn(true, animated: false)
		}
	}
	
	@IBAction func buttonPressed(_ sender: Any) {
		self.presenter.buttonContinuePressed()
	}
	
	var presenter: LoginPresenterViewInterface!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	func setupView() {
		self.topView.backgroundColor = CustomColor.color2.uiColor
		
		self.titleLabel.text = "Para acceder a la comunicación de cambio de domicilio, debes hacerlo mediante tu identidad electrónica Cl@ve"
		
		self.iconImage.image = UIImage(named: "logo")
		
		self.switchOption.onTintColor = CustomColor.color2.uiColor
		self.switchOption.setOn(false, animated: false)
		self.switchOption.addTarget(self, action: #selector(turnSecondSwitch), for: UIControl.Event.valueChanged)
		
		self.switchLabel.text = "He leído y acepto las Condiciones legales"
		
		self.buttonAccess.isUserInteractionEnabled = false
		self.buttonAccess.backgroundColor = CustomColor.color11.uiColor
		self.buttonAccess.setTitleColor(CustomColor.color5.uiColor, for: .normal)
		self.buttonAccess.layer.cornerRadius = 10
		self.buttonAccess.setTitle("Acceder con Cl@ve", for: .normal)
		
		self.questionLabel.tintColor = CustomColor.color1.uiColor
		self.questionLabel.text = "¿Qué es Cl@ve?"
		
	}
	
	@objc
	func turnSecondSwitch(srcObj: UISwitch) {
		let switchStatus: Bool = srcObj.isOn

		if switchStatus {
			switchOption.setOn(false, animated: true)
		} else {
			switchOption.setOn(true, animated: true)
			self.buttonAccess.isUserInteractionEnabled = true
			self.buttonAccess.backgroundColor = CustomColor.color1.uiColor
			self.buttonAccess.setTitleColor(CustomColor.color10.uiColor, for: .normal)
			
		}
	}

	
	

}

extension LoginViewController: LoginViewPresenterInterface {
	
}
