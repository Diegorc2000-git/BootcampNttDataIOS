//
//  SignUpViewController.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 10/2/22.
//

import UIKit

class SignUpViewController: UIViewController {

	var presenter: SignUpPresenterProtocol?
	
	// MARK: - Outlet
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var userName: UITextField!
	@IBOutlet weak var secondName: UITextField!
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!
	@IBOutlet weak var passwordVerification: UITextField!
	@IBOutlet weak var signUpButton: UIButton!
	
	// MARK: - Outlet Action
	@IBAction func signUpPressed(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	@IBAction func backButtonPressed(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		setupBackground()
		setupNav()
		setupIconsInTextFields()
		setupView()
    }
	
	func setupBackground() {
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "backgroundWhite")
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
	}
	func setupNav() {
		navigationController?.isNavigationBarHidden = true
		tabBarController?.tabBar.isHidden = true
	}
	func setupIconsInTextFields() {
		let nameUserImage = UIImage(named: "idIcon")
				addLeftImageTo(txtField: userName, andImage: nameUserImage!)
		let secondNameUserImage = UIImage(named: "userIcon")
				addLeftImageTo(txtField: secondName, andImage: secondNameUserImage!)
		let emailUserImage = UIImage(named: "emailIcon")
				addLeftImageTo(txtField: email, andImage: emailUserImage!)
		let lockImage = UIImage(named: "lockIcon")
				addLeftImageTo(txtField: password, andImage: lockImage!)
		let userImage = UIImage(named: "lockIcon")
				addLeftImageTo(txtField: passwordVerification, andImage: userImage!)
		
	}
	func setupView() {
		self.signUpButton.layer.cornerRadius = 10
	}
	func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
		   let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
		   leftImageView.image = img
		   txtField.leftView = leftImageView
		   txtField.leftViewMode = .always
	   }
	
}
