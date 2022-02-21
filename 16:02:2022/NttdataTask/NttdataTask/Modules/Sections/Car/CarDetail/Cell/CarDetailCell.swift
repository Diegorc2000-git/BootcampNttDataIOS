//
//  CarDetailCell.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 17/2/22.
//

import UIKit

protocol CarDetailCellProtocol {
	func configDetailCell(data: ArrayCar)
}

class CarDetailCell: UITableViewCell {

	// MARK: - IBOutlet
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var carImage: UIImageView!
	@IBOutlet weak var milesPerGallonText: UILabel!
	@IBOutlet weak var milesPerGallonLabel: UILabel!
	@IBOutlet weak var milesperGallonIcon: UIImageView!
	@IBOutlet weak var horsePowerText: UILabel!
	@IBOutlet weak var horsePowerLabel: UILabel!
	@IBOutlet weak var horsePowerIcon: UIImageView!
	@IBOutlet weak var weightInLbsText: UILabel!
	@IBOutlet weak var weightInLbsLabel: UILabel!
	@IBOutlet weak var weightInLbsIcon: UIImageView!
	@IBOutlet weak var yearText: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var yearIcon: UIImageView!
	@IBOutlet weak var cylindersText: UILabel!
	@IBOutlet weak var cylindersLabel: UILabel!
	@IBOutlet weak var cylindersIcon: UIImageView!
	@IBOutlet weak var displacementText: UILabel!
	@IBOutlet weak var displacementLabel: UILabel!
	@IBOutlet weak var displacementIcon: UIImageView!
	@IBOutlet weak var accelerationText: UILabel!
	@IBOutlet weak var accelerationLabel: UILabel!
	@IBOutlet weak var accelerationIcon: UIImageView!
	@IBOutlet weak var originText: UILabel!
	@IBOutlet weak var originLabel: UILabel!
	@IBOutlet weak var originIcon: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
		self.milesPerGallonText.text = "Millas por galón"
		self.milesperGallonIcon.image = UIImage(named: "gallons")
		self.horsePowerText.text = "Caballos de fuerza"
		self.horsePowerIcon.image = UIImage(named: "horsepower")
		self.weightInLbsText.text = "Peso en libras"
		self.weightInLbsIcon.image = UIImage(named: "weight")
		self.yearText.text = "Edad"
		self.yearIcon.image = UIImage(named: "year")
		self.cylindersText.text = "Cilindrada"
		self.cylindersIcon.image = UIImage(named: "cylinder")
		self.displacementText.text = "Autonomia"
		self.displacementIcon.image = UIImage(named: "autonomia")
		self.accelerationText.text = "Aceleración"
		self.accelerationIcon.image = UIImage(named: "acceleration")
		self.originText.text = "Origen"
		self.originIcon.image = UIImage(named: "original")
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension CarDetailCell: CarDetailCellProtocol {
	
	internal func configDetailCell(data: ArrayCar) {
		self.carImage.image = UIImage(named: data.image ?? "error")
		self.name.text = data.name?.uppercased()
		self.milesPerGallonLabel.text = data.milesPerGallon
		self.horsePowerLabel.text = data.horsepower
		self.weightInLbsLabel.text = data.weightInLbs
		self.yearLabel.text = data.year
		self.cylindersLabel.text = data.cylinders
		self.displacementLabel.text = data.displacement
		self.accelerationLabel.text = data.acceleration
		self.originLabel.text = data.origin
	}
}
