//
//  AlgorithmTableViewCell.swift
//  iSort
//
//  Created by Antonio Abbatiello on 03/04/24.
//

import UIKit

class AlgorithmTableViewCell: UITableViewCell {
    @IBOutlet weak var nameComplexityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.accessoryType = .disclosureIndicator
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with algorithm: Algorithm) {
        nameComplexityLabel.text = algorithm.name + " " + algorithm.complexity
    }

}
