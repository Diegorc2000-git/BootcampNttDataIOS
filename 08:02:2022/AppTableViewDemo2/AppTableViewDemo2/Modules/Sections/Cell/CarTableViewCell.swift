//
//  CarTableViewCell.swift
//  AppTableViewDemo2
//
//  Created by Diego Rodriguez Casillas on 8/2/22.
//

import UIKit

protocol CarTableViewCellProtocol{
	func configCell(model: CarsModel)
}

class CarTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet weak var imageCell: UIImageView!
	@IBOutlet weak var nameCarLabel: UILabel!
	@IBOutlet weak var colorCarLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CarTableViewCell: CarTableViewCellProtocol {
	
	internal func configCell(model: CarsModel) {
		self.nameCarLabel.text = model.name
		self.colorCarLabel.text = model.color
		self.imageCell.image = model.image
	}
}
