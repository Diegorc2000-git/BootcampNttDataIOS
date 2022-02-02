//
//  ViewController.swift
//  AppDatePicker
//
//  Created by Diego Rodriguez Casillas on 2/2/22.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - IBOutlets
	@IBOutlet weak var myDateLabel: UILabel!
	@IBOutlet weak var myTextFieldLabel: UITextField!
	
	@IBAction func myTextFieldAction(_ sender: UITextField) {
		let pickerDateView = UIDatePicker()
		pickerDateView.datePickerMode = .dateAndTime
		myTextFieldLabel.inputView = pickerDateView
		pickerDateView.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@objc
	func datePickerValueChanged(_ myCustomDatePicker: UIDatePicker) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .medium
		dateFormatter.timeStyle = .medium
		self.myDateLabel.text = dateFormatter.string(from: myCustomDatePicker.date)
	}

}

