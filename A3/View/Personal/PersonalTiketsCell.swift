//
//  PersonalTiketsCell.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class PersonalTiketsCell: UITableViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var seatNumberLabel: UILabel!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
