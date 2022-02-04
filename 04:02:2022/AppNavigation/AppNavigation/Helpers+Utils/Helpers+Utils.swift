//
//  Helpers+Utils.swift
//  AppNavigation
//
//  Created by Diego Rodriguez Casillas on 4/2/22.
//

import Foundation
import UIKit

//Esta clase sirve para reutilizar el mismo codigo y ahorrase muchas lineas de codigo

func displayAlertVC(myTitle: String, myMessage: String) -> UIViewController {
	let alertVC = UIAlertController(title: myTitle, message: myMessage, preferredStyle: .alert)
	alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
	return alertVC
	
}

func createPickerView(myTextField: UITextField,
					  myArray: [String],
					  myTag: Int,
					  myDelegate: UIPickerViewDelegate,
					  myDataSourcePicker: UIPickerViewDataSource) -> UIPickerView {
	let pickerView = UIPickerView()
	pickerView.delegate = myDelegate
	pickerView.dataSource = myDataSourcePicker
	pickerView.tag = myTag
	myTextField.inputView = pickerView
	myTextField.text = myArray[0]
	return pickerView
	
}

struct GlobalUserData {
	var nameData: String?
	var surnameData: String?
	var phoneData: String?
	var directionsData: String?
	var yearDogData: String?
	var cpData: String?
	var countryData: String?
	var geograficalPositionData: String?
	
}
