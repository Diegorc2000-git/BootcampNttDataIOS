//
//  LoginViewController.swift
//  AppPart4
//
//  Created by Diego Rodriguez Casillas on 9/2/22.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {

	var presenter: LoginPresenterProtocol?
	
	// MARK: - Outlet
	@IBOutlet weak var loginImage: UIImageView!
	@IBOutlet weak var userNameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var signUpLabel: UILabel!
	@IBOutlet weak var signUpButton: UIButton!
	
	// MARK: - Outlet Action
	@IBAction func loginPressed(_ sender: Any) {
		let vc = StartViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	@IBAction func signUpPressed(_ sender: Any) {
		let vc = SignUpViewController()
		navigationController?.pushViewController(vc, animated: true)
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
		backgroundImage.image = UIImage(named: "backgroundLogin&SignUp")
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
	}
	func setupNav() {
		navigationController?.isNavigationBarHidden = true
		tabBarController?.tabBar.isHidden = true
	}
	func setupIconsInTextFields() {
		let userImage = UIImage(named: "userIcon")
				addLeftImageTo(txtField: userNameTextField, andImage: userImage!)
		let lockImage = UIImage(named: "lockIcon")
				addLeftImageTo(txtField: passwordTextField, andImage: lockImage!)
	}
	func setupView() {
		loginButton.layer.cornerRadius = 10
	}
	func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
		   let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
		   leftImageView.image = img
		   txtField.leftView = leftImageView
		   txtField.leftViewMode = .always
	}
	
}
