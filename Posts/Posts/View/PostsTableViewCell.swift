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
    
    @IBOutlet weak var button: UIButton!
    
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
    }
    
    func setup(post: PostPresentation?) {
        titleLabel.text = post?.title ?? ""
        if let likes = post?.likesCount {
            likesLabel.text = String(likes) 
        }
        dayAgoLabel.text = post?.dayAgo ?? ""
        previewText.text = post?.previewText ?? ""
        if post?.selected == true {
            previewText.numberOfLines = 0
            button.setTitle("Collapse", for: .normal)
        } else {
            previewText.numberOfLines = 2
            button.setTitle("Expand", for: .normal) 
        }
    }
}
