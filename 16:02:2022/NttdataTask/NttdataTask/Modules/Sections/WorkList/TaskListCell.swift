//
//  TaskListCell.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import UIKit

class TaskListCell: UITableViewCell {

	@IBOutlet weak var lblmyName: UILabel!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
