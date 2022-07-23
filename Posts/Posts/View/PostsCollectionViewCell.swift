//
//  PostsCollectionViewCell.swift
//  Posts
//
//  Created by Andrey Boyko on 23.07.2022.
//

import UIKit

class PostsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dayAgoLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(post: Post) {
        likesLabel.text = post.likesCount
        if let dayAgo = post.timeshamp {
            dayAgoLabel.text = String(dayAgo)
        }
        textView.text = post.previewText
        title.text = post.title
    }
}
