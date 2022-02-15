//
//  SegundaViewController.swift
//  AppDatePicker
//
//  Created by Diego Rodriguez Casillas on 2/2/22.
//

import UIKit

class SegundaViewController: UIViewController {

	// MARK: - Variables locales
	var pickerCarsArrayData = ["Ferrari", "Honda", "Alpine", "Opel", "Aston Martin"]
	
	// MARK: - IBOutlets
	@IBOutlet var viewGeneric: UIView!
	@IBOutlet weak var tituloCarLabel: UILabel!
	@IBOutlet weak var detalleCarTextView: UITextView!
	@IBOutlet weak var imagenCarImageView: UIImageView!
	@IBOutlet weak var seleccionCarPickerView: UIPickerView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		self.viewGeneric.backgroundColor = UIColor.gray
		
		self.detalleCarTextView.backgroundColor = UIColor.gray
		
		self.seleccionCarPickerView.backgroundColor = UIColor.gray
		self.seleccionCarPickerView.delegate = self
		self.seleccionCarPickerView.dataSource = self
		
		self.title = pickerCarsArrayData[0]
		
		self.tituloCarLabel.text = pickerCarsArrayData[0]
		self.imagenCarImageView.image = UIImage(named: pickerCarsArrayData[0])
		self.detalleCarTextView.text = "Ferrari es una compañía de automóviles deportivos con sede en Maranello-Módena, Emilia-Romaña, Italia. Este fabricante es el resultante de la idea de su fundador Enzo Ferrari de crear una marca de automóviles de turismo con prestaciones lujosas y deportivas, basándose en los éxitos obtenidos a partir de la creación de su Scuderia Ferrari de automovilismo en 1929. Sus mejores autos fueron realizados en el taller de Abasto."
    }
    
}

extension SegundaViewController: UIPickerViewDelegate {
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerCarsArrayData[row]
	}
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 40
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
		self.title = pickerCarsArrayData[row]
		self.tituloCarLabel.text = pickerCarsArrayData[row]
		self.imagenCarImageView.image = UIImage(named: pickerCarsArrayData[row])
		
		switch row {
		case 0:
			self.tituloCarLabel.text = pickerCarsArrayData[row]
			self.detalleCarTextView.text = "En el año 2015 la marca italiana decidió sustituir su Ferrari 458 por el Ferrari 488. El cambio fue grande, pues del motor 4,5 litros V8 atmosférico se pasó a un 3,9 litros con la misma disposición de 8 cilindros en V pero recurriendo un doble turbo para conseguir una potencia máxima de 670 CV a 8.000 rpm."
		case 1:
			self.tituloCarLabel.text = pickerCarsArrayData[row]
			self.detalleCarTextView.text = "Por lo demás, el Alpine A110S no muestra ningún cambio con respecto al modelo de fábrica, de forma que bajo el capó se encuentra el mismo propulsor turboalimentado de cuatro cilindros y 1.8 litros del Mégane RS"
		case 2:
			self.tituloCarLabel.text = pickerCarsArrayData[row]
			self.detalleCarTextView.text = "Los motores de serie B se han convertido en los motores de Honda más codiciados debido a su fiabilidad y su capacidad de producir una gran potencia en relación con su cilindrada."
		case 3:
			self.tituloCarLabel.text = pickerCarsArrayData[row]
			self.detalleCarTextView.text = "La gama de motores se compondrá de una selección de bloques diésel y gasolina. Dependiendo de motor elegido nos encontraremos con una caja de cambios manual o una transmisión automática."
		case 4:
			self.tituloCarLabel.text = pickerCarsArrayData[row]
			self.detalleCarTextView.text = "En 2014 Aston Martin produjo las siguientes gamas de modelos: DB9, con motor V12 de 6 litros; Vantage, con motores V8 o V12 y opciones S, Roadster y N430, el Aston Martin Rapide S de 4 puertas y el Vanquish con motor V12, 568 CV de potencia, 201 mph velocidad máxima y 0-60 mph en solo 3,6 segundos."
			
		default:
			break
		}
	}
	
}

extension SegundaViewController: UIPickerViewDataSource {
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerCarsArrayData.count
	}
	
}
