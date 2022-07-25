//
//  PostViewController.swift
//  Posts
//
//  Created by Andrey Boyko on 24.07.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var postText: UITextView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var dayAgo: UILabel!
    
    var url = ""
    let testPost = ApiClient()
    
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
            self.likesLabel.text = String(post.post.likesCount ?? 0) ?? ""
            self.dayAgo.text = Date().timeAgoDisplay(time: post.post.timeshamp)
        })
    }
}


