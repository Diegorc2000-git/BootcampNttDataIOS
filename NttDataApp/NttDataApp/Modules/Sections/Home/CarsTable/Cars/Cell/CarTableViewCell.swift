//
//  CarTableViewCell.swift
//  NttDataApp
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import UIKit

protocol CarTableViewCellProtocol {
	func setupCell(name: String)
}

class CarTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet weak var viewCell: UIView!
	@IBOutlet weak var nameLabelCell: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension CarTableViewCell: CarTableViewCellProtocol {
	
	internal func setupCell(name: String) {
		self.nameLabelCell.text = name
	}
}
