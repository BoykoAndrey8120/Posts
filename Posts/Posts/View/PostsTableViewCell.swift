//
//  PostsTableViewCell.swift
//  Posts
//
//  Created by Andrey Boyko on 23.07.2022.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var previewText: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dayAgoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(post: Post?) {
        titleLabel.text = post?.title ?? ""
        if let likes = post?.likesCount {
            likesLabel.text = String(likes) 
        }
        if let dayAgo = post?.timeshamp {
            dayAgoLabel.text = String(dayAgo)
        }
        previewText.text = post?.previewText ?? ""
    }
    
}
