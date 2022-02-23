//
//  TaskListCell.swift
//  NttdataTask
//
//  Created by Diego Rodriguez Casillas on 21/2/22.
//

import UIKit

protocol TaskListProtocol {
	
}

class TaskListCell: UITableViewCell {

	
	@IBOutlet weak var titleTask: UILabel!
	@IBOutlet weak var priorityTask: UILabel!
	@IBOutlet weak var dateTask: UILabel!
	@IBOutlet weak var categoryTask: UILabel!
	@IBOutlet weak var descriptionTask: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension TaskListCell: TaskListProtocol {
	
}
