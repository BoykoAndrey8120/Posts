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
    
    
    var delegate: ClickDelegate?
    var cellIndex: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func tapButton(_ sender: Any) {
        delegate?.clicked(cellIndex!.row)
       // previewText.numberOfLines = 0
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
        if post?.selected == true {
         previewText.numberOfLines = 0
        } else {
            previewText.numberOfLines = 2
        }
    }
    
}
