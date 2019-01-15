//
//  CollectionTableViewCell.swift
//  ios-sdk-examples
//
//  Created by tantv on 1/9/19.
//  Copyright © 2019 tantv. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

  @IBOutlet weak var imgIcon: UIImageView!
  @IBOutlet weak var tvTitle: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
