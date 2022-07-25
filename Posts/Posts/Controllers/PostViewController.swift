//
//  PostViewController.swift
//  Posts
//
//  Created by Andrey Boyko on 24.07.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var postText: UITextView!
    @IBOutlet private weak var likesLabel: UILabel!
    @IBOutlet private weak var dayAgo: UILabel!
    
    var url = ""
    private let testPost = ApiClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testPost.fetchPost(urlString: url, handler: { [weak self] post in
            guard let self = self else { return }
            self.label.text = post.post.title
            self.postText.text = post.post.text
            let urlImage = URL(string: post.post.postImage ?? "")
            if let urlImage = urlImage {
                self.image.load(url: urlImage)
            }
            self.likesLabel.text = String(post.post.likesCount ?? 0)
            self.dayAgo.text = Date().timeAgoDisplay(time: post.post.timeshamp)
        })
    }
}


