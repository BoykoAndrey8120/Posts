//
//  ViewController.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
  //  @IBOutlet weak var postCollection: UICollectionView!
    
    let testPosts = ApiClient()
    var array: [Post] = []
  

    override func viewDidLoad() {
        super.viewDidLoad()
        testPosts.fetchPosts(handler: { [self] posts in
            self.array = posts.posts
            print(array)
            self.postsTableView.reloadData()
          //  self?.postCollection.reloadData()
           // self?.postsTableView.reloadData()
        })
        
        print(testPosts.postsArray)
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
//        postCollection.register(UINib(nibName: "PostsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostsCollectionViewCell")
    }

//    @IBAction func sortButtonTap(_ sender: Any) {
//    }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as? PostsTableViewCell else { return UITableViewCell() }
        cell.setup(post: array[indexPath.row])
        return cell
    }
    
    
}

//extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return array.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostsCollectionViewCell", for: indexPath) as? PostsCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        cell.setup(post: array[indexPath.item])
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: collectionView.layer.frame.size.width, height: 100.0)
//    }
//}


