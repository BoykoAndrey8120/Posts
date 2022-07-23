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
    var array: [Post] = []
  

    override func viewDidLoad() {
        super.viewDidLoad()
        testPosts.fetchPosts(handler: { [weak self] posts in
            self?.array = posts.posts
            self?.postCollection.reloadData()
        })
        
        print(testPosts.postsArray)
        postCollection.delegate = self
        postCollection.dataSource = self
        postCollection.register(UINib(nibName: "PostsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostsCollectionViewCell")
    }

    @IBAction func sortButtonTap(_ sender: Any) {
    }
}

//MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostsCollectionViewCell", for: indexPath) as? PostsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(post: array[indexPath.item])
        return cell
    }
}
