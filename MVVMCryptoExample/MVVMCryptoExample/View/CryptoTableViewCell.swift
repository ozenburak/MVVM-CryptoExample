//
//  CryptoTableViewCell.swift
//  MVVMCryptoExample
//
//  Created by burak ozen on 14.12.2021.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var currencyText: UILabel!
    
    @IBOutlet weak var priceText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
