//
//  ViewController.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import UIKit

protocol ClickDelegate {
    func clicked(_ row: Int)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    
    let testPosts = ApiClient()
    var array = [PostPresentation]()
    var new: News? = nil
    let segueIdentifier = "PostViewController"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        testPosts.fetchPosts(handler: { [weak self] posts in
                    guard let self = self else { return }
                    self.array = posts.posts.map { PostPresentation(post: $0) }
                    self.postsTableView.reloadData()
                })
        
//        print(testPosts.presentationModelArray)
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
    }

    @IBAction func tapSortButton(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Sort feed by rating", style: .default , handler:{ (UIAlertAction)in
                self.array.sort{
                    $0.likesCount ?? 0 > $1.likesCount ?? 0 }
                self.postsTableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Sort feed by date", style: .default , handler:{ (UIAlertAction)in
                self.array.sort{
                    $0.dayAgo ?? "" > $1.dayAgo ?? "" }
                self.postsTableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                
            }))

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
    

}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as? PostsTableViewCell else { return UITableViewCell() }
        cell.setup(post: array[indexPath.row])
        cell.cellIndex = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(array[indexPath.row].id ?? "")
//        if let id = array[indexPath.row].id {
//        testPosts.fetchPost(urlString: "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json", handler: { [weak self] post in
//            guard let self = self else { return }
//            //self. = posts.posts.map { PostPresentation(post: $0) }
//            let newPost = News(postId: post.post.postId,
//                               timeshamp: post.post.timeshamp,
//                               title: post.post.title,
//                               text: post.post.text,
//                               postImage: post.post.postImage,
//                               likes_count: post.post.likes_count)
//            self.new = newPost
//            print(newPost)
//        })
//        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: segueIdentifier) as? PostViewController
        if let vc = vc {
            if let id = array[indexPath.row].id {
                vc.url = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json"
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension ViewController: ClickDelegate {
    func clicked(_ row: Int) {
        if array[row].selected == nil { array[row].selected = true
        } else {
            array[row].selected?.toggle()
        }
        postsTableView.reloadData()
    }
}


