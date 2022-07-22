//
//  ViewController.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let testPosts = ApiClient()
    let post: Posts? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        testPosts.fetchPosts { (post) in
            print(post)
        }
    }


}

