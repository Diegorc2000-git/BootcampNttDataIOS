//
//  CarCell.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 16/2/22.
//

import UIKit

protocol CarCellProtocol {
	func configCell(data: ArrayCar)
}

class CarCell: UITableViewCell {

	// MARK: - IBOutlet
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var yearLabel: UILabel!
	@IBOutlet weak var imageCar: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
		// imagen circular
		self.imageCar.layer.cornerRadius = self.imageCar.frame.width/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension CarCell: CarCellProtocol {
	internal func configCell(data: ArrayCar) {
		self.imageCar.image = UIImage(named: data.image ?? "error")
		self.nameLabel.text = data.name
		self.yearLabel.text = data.year
	}
}
