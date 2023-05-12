//
//  PersonalHeaderTableViewCell.swift
//  A3
//
//  Created by wd on 2023/5/10.
//

import UIKit

class PersonalHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var userNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if let nameStored = UserDefaults.standard.string(forKey: UserDefaultsNameUser) {
            
            userNameLabel.text = nameStored
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
