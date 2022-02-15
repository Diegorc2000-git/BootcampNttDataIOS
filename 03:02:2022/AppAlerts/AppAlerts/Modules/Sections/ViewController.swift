//
//  ViewController.swift
//  AppAlerts
//
//  Created by Diego Rodriguez Casillas on 3/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - Variables locales
	var loginTextField: UITextField?
	var passwordTextField: UITextField?

	
	// MARK: - IBOutlet
	@IBOutlet weak var uiAlertControllerSimple: UIButton!
	@IBOutlet weak var uiAlertControllerTextField: UIButton!
	@IBOutlet weak var uiAlertControllerLoginForm: UIButton!
	@IBOutlet weak var uiAlertControllerMultiplieButtons: UIButton!
	@IBOutlet weak var uiActionSheetStandar: UIButton!
	
	// MARK: - IBActions
	@IBAction func alertVC(_ sender: AnyObject) {
		
		switch sender.tag {
		case 0:
			self.present(self.myAlertVC(myTitle: "Alert Controller Simple",
										myMessage: "Este alert controller es la presentación por defecto"),
						 animated: true,
						 completion: nil)
		case 1:
			let alertVC = UIAlertController(title: "Alert Controller TextField", message: "Este alert controller tiene un TextField", preferredStyle: .alert)
			let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
			let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
				if !(self.loginTextField?.text?.isEmpty ?? false) {
					let storyboard = UIStoryboard(name: "Main", bundle: nil)
					let vc = storyboard.instantiateViewController(withIdentifier: "TercerViewController")
					vc.modalTransitionStyle = .flipHorizontal // animacion al abrir la ventana
					self.present(vc, animated: true, completion: nil)
				}
			})
			alertVC.addAction(cancelAction)
			alertVC.addAction(aceptarAction)
			
			alertVC.addTextField { (textResult) in
				self.loginTextField = textResult
				self.loginTextField?.placeholder = "Introduce tu usuario"
			}
			
			self.present(alertVC, animated: true, completion: nil)
			
		case 2:
			let alertVC = UIAlertController(title: "Alert Controller Login Form", message: "Este alert controller es un formulario de login", preferredStyle: .alert)
			let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
			let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: { _ in
				if !(self.loginTextField?.text?.isEmpty ?? false) && !(self.passwordTextField?.text?.isEmpty ?? false) {
					let storyboard = UIStoryboard(name: "Main", bundle: nil)
					let vc = storyboard.instantiateViewController(withIdentifier: "TercerViewController")
					vc.modalTransitionStyle = .crossDissolve // animacion al abrir la ventana
					vc.modalPresentationStyle = .fullScreen //lo que ocupa en la pagina
					self.present(vc, animated: true)
				}
			})
			alertVC.addAction(cancelAction)
			alertVC.addAction(aceptarAction)
			
			alertVC.addTextField { (textResult) in
				self.loginTextField = textResult
				self.loginTextField?.placeholder = "Introduce tu usuario"
			}
			
			alertVC.addTextField { (textResult) in
				self.passwordTextField = textResult
				self.passwordTextField?.placeholder = "Introduce tu contraseña"
				self.passwordTextField?.isSecureTextEntry = true // para que la contraseña se vea con **
			}
			
			self.present(alertVC, animated: true, completion: nil)
			
		case 3:
			let alertVC = UIAlertController(title: "Alert Controller Multiple Buttons", message: "Este alert controller es un formulario de login", preferredStyle: .alert)
			alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
			alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
			alertVC.addAction(UIAlertAction(title: "Boton 3", style: .destructive, handler: nil))
			alertVC.addAction(UIAlertAction(title: "Boton 4", style: .default, handler: { _ in
				self.choosePhotoLibrary()
			}))
			
			self.present(alertVC, animated: true, completion: nil)
			
		default:
			let alertVC = UIAlertController(title: "Alert Controller Standar", message: "Este alert controller es un formulario de login", preferredStyle: .actionSheet)
			alertVC.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
			alertVC.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
			alertVC.addAction(UIAlertAction(title: "Boton 3", style: .destructive, handler: nil))
			alertVC.addAction(UIAlertAction(title: "Boton 4", style: .destructive, handler: { _ in
				self.choosePhotoLibrary()
			}))
			
			self.present(alertVC, animated: true, completion: nil)
		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		customizationButton()
	}

	// MARK: - Private Methods
	private func customizationButton() {
		uiAlertControllerSimple.layer.cornerRadius = 10
		uiAlertControllerTextField.layer.cornerRadius = 15
		uiAlertControllerLoginForm.layer.cornerRadius = 20
		uiAlertControllerMultiplieButtons.layer.cornerRadius = 25
		uiActionSheetStandar.layer.cornerRadius = 30
		
	}
	
	private func myAlertVC(myTitle: String, myMessage: String) -> UIAlertController {
		let alertVC = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
		let aceptarAction = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
		alertVC.addAction(cancelAction)
		alertVC.addAction(aceptarAction)
		return alertVC
		
	}

}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	func choosePhotoLibrary() {
		let imagePC = UIImagePickerController()
		imagePC.sourceType = .photoLibrary
		imagePC.delegate = self
		imagePC.allowsEditing = true
		present(imagePC, animated: true, completion: nil)
	}
}
