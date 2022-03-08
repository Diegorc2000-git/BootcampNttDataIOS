//
//  GrouponCell.swift
//  GrouponForNttdata
//
//  Created by Diego Rodriguez Casillas on 8/3/22.
//

import UIKit
import Kingfisher

protocol GrouponCellProtocol {
	func configCell(data: DataViewModel)
}

class GrouponCell: UITableViewCell, ReuseIdentifierView {

	// MARK: - IBOutlet
	@IBOutlet weak var myImageGrouponView: UIImageView!
	@IBOutlet weak var myTitleLabel: UILabel!
	@IBOutlet weak var myTendenciaLabel: UILabel!
	@IBOutlet weak var myDescriptionLabel: UILabel!
	@IBOutlet weak var myPriceLabel: UILabel!
	@IBOutlet weak var myPromotionLabel: UILabel!
	
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension GrouponCell: GrouponCellProtocol {
	func configCell(data: DataViewModel) {
		
	}
	
}
