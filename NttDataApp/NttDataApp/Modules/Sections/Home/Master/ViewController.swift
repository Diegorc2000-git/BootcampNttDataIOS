//
//  ViewController.swift
//  NttDataApp
//
//  Created by Diego Rodriguez Casillas on 3/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet var viewGeneric: UIView!
	@IBOutlet weak var countries: UILabel!
	@IBOutlet weak var countriesImages: UIImageView!
	@IBOutlet weak var countriesPickerView: UIPickerView!
	@IBOutlet weak var dateTextField: UITextField!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var dateReturnTextField: UITextField!
	@IBOutlet weak var dateReturnLabel: UILabel!
	@IBOutlet weak var buttonContinue: UIButton!
	
	// MARK: - Local Variables
	var pickerCountriesArrayData = ["Hendaya - Francia", "Madrid - España", "Miami - EEUU", "Bogota - Colombia", "Santiago de Chile - Chile", "Sao Paulo - Brasil"]
	var loginTextField: UITextField?
	var passwordTextField: UITextField?

	// MARK: - Action
	@IBAction func dateTextFieldAction(_ sender: UITextField) {
		let pickerDateView = UIDatePicker()
		pickerDateView.datePickerMode = .dateAndTime
		pickerDateView.preferredDatePickerStyle = .wheels
		dateTextField.inputView = pickerDateView
		pickerDateView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
	}
	
	@IBAction func dateReturnTextFieldAction(_ sender: UITextField) {
		let pickerDateReturnView = UIDatePicker()
		pickerDateReturnView.datePickerMode = .dateAndTime
		pickerDateReturnView.preferredDatePickerStyle = .wheels
		dateReturnTextField.inputView = pickerDateReturnView
		pickerDateReturnView.addTarget(self, action: #selector(dateReturnPickerValueChanged(_:)), for: .valueChanged)
	}
	
	@IBAction func buttonContinuePressed(_ sender: AnyObject) {
		
		let alertVC = UIAlertController(title: "Login", message: "Inicia sesion para poder reservar el viaje", preferredStyle: .alert)
		let cancelAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
		let aceptAction = UIAlertAction(title: "Reservar", style: .default, handler: { _ in
			if !(self.loginTextField?.text?.isEmpty ?? false) && !(self.passwordTextField?.text?.isEmpty ?? false) {
					let storyboard = UIStoryboard(name: "Main", bundle: nil)
					let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
					vc.modalTransitionStyle = .flipHorizontal // animacion al abrir la ventana
					self.present(vc, animated: true)
			}
		})
		alertVC.addAction(cancelAction)
		alertVC.addAction(aceptAction)
		
		alertVC.addTextField { (textResult) in
			self.loginTextField = textResult
			self.loginTextField?.placeholder = "Introduce tu Usuario"
		}
		
		alertVC.addTextField { (textResult) in
			self.passwordTextField = textResult
			self.passwordTextField?.placeholder = "Introduce tu contraseña"
			self.passwordTextField?.isSecureTextEntry = true
		}
		
		self.present(alertVC, animated: true, completion: nil)

	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureView()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}
	
	@objc
	func datePickerValueChanged(_ myCustomDatePicker: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .medium
		self.dateLabel.text = dateFormatter.string(from: myCustomDatePicker.date)
		
		self.dateLabel.isHidden = false

	}
	@objc
	func dateReturnPickerValueChanged(_ myCustomDateReturnPicker: UIDatePicker) {
		let dateReturnFormatter = DateFormatter()
		dateReturnFormatter.dateStyle = .medium
		dateReturnFormatter.timeStyle = .medium
		self.dateReturnLabel.text = dateReturnFormatter.string(from: myCustomDateReturnPicker.date)
		self.dateReturnLabel.isHidden = false

	}

	func configureView() {
		self.dateLabel.isHidden = true
		self.dateReturnLabel.isHidden = true

		self.countriesPickerView.delegate = self
		self.countriesPickerView.dataSource = self
		
		self.countries.text = pickerCountriesArrayData[0]
		self.countriesImages.image = UIImage(named: pickerCountriesArrayData[0])
		
		self.buttonContinue.layer.cornerRadius = 20
		
	}
	
	@IBAction func cerrarVCs(segue: UIStoryboardSegue) {
		print("Logout completado")
	}

}

extension ViewController: UIPickerViewDelegate {
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerCountriesArrayData[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 40
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		self.countries.text = pickerCountriesArrayData[row]
		self.countriesImages.image = UIImage(named: pickerCountriesArrayData[row])
		
		switch row {
		case 0:
			self.countries.text = pickerCountriesArrayData[row]
		case 1:
			self.countries.text = pickerCountriesArrayData[row]
		case 2:
			self.countries.text = pickerCountriesArrayData[row]
		case 3:
			self.countries.text = pickerCountriesArrayData[row]
		case 4:
			self.countries.text = pickerCountriesArrayData[row]
		case 5:
			self.countries.text = pickerCountriesArrayData[row]
		default:
			break
		}
	}
	
}

extension ViewController: UIPickerViewDataSource {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerCountriesArrayData.count
	}
}
