//
//  HNStoryTableViewCell.swift
//  HNReader
//
//  Created by Boris on 04.02.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

import UIKit

class HNStoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var commentNumberLabel: UILabel!
    
    var story: Story? {
        didSet {
            configureCell()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell() {
        titleLabel.text = story?.title
        if let count = story?.kids?.count {
            commentNumberLabel.text = "\(count)"
        }
    }

}
