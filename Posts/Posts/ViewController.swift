//
//  ViewController.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var postCollection: UICollectionView!
    
    let testPosts = ApiClient()
    let post: Posts? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        testPosts.fetchPosts { (post) in
            print(post)
        }
    }

    @IBAction func sortButtonTap(_ sender: Any) {
    }
    
}

