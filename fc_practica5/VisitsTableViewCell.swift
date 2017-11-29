//
//  VisitsTableViewCell.swift
//  fc_practica5
//
//  Created by Carlos Villa on 28/11/2017.
//  Copyright © 2017 Carlos Fernando. All rights reserved.
//

import UIKit

class VisitsTableViewCell: UITableViewCell {

    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var detailText: UILabel!
    @IBOutlet weak var notas: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
