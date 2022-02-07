//
//  MonthTableViewCell.swift
//  AppIntroTableView
//
//  Created by Diego Rodriguez Casillas on 7/2/22.
//

import UIKit

protocol MonthTableViewCellProtocol {
	func setupCell(name: String)
}

class MonthTableViewCell: UITableViewCell {

	// MARK: - Outlets
	@IBOutlet weak var nameLabelCell: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MonthTableViewCell: MonthTableViewCellProtocol {
	
	internal func setupCell(name: String) {
		self.nameLabelCell.text = name
	}
	
}
