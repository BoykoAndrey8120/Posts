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
    
    @IBOutlet private weak var postsTableView: UITableView!
    
    private let testPosts = ApiClient()
    private var arrayOfPost = [PostPresentation]()
    private let segueIdentifier = "PostViewController"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        testPosts.fetchPosts(handler: { [weak self] posts in
                    guard let self = self else { return }
                    self.arrayOfPost = posts.posts.map { PostPresentation(post: $0) }
                    self.postsTableView.reloadData()
                })

        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(UINib(nibName: "PostsTableViewCell", bundle: nil), forCellReuseIdentifier: "PostsTableViewCell")
    }

    //MARK: - Action
    
    
    @IBAction private func tapOpenCloseButton(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Open", style: .default , handler:{ (UIAlertAction) in
            for (index, _) in self.arrayOfPost.enumerated() {
                self.arrayOfPost[index].selected = true
            }
            self.postsTableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Close", style: .default , handler:{ (UIAlertAction) in
            for (index, _) in self.arrayOfPost.enumerated() {
                self.arrayOfPost[index].selected = false
            }
            self.postsTableView.reloadData()
        }))
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
        }))
        self.present(alert, animated: true, completion: {
        })
    }
    
    @IBAction private func tapSortButton(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Sort feed by rating", style: .default , handler:{ (UIAlertAction)in
            self.arrayOfPost.sort{
                $0.likesCount ?? 0 > $1.likesCount ?? 0 }
            self.postsTableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Sort feed by date", style: .default , handler:{ (UIAlertAction)in
            self.arrayOfPost.sort{
                $0.dayAgo ?? "" < $1.dayAgo ?? "" }
            self.postsTableView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            
        }))
        
        self.present(alert, animated: true, completion: {
        })
    }
}

//MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell", for: indexPath) as? PostsTableViewCell else { return UITableViewCell() }
        cell.setup(post: arrayOfPost[indexPath.row])
        cell.cellIndex = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: segueIdentifier) as? PostViewController
        if let vc = vc {
            if let id = arrayOfPost[indexPath.row].id {
                vc.url = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/posts/\(id).json"
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

//MARK: - ClickDelegate
extension ViewController: ClickDelegate {
    func clicked(_ row: Int) {
        if arrayOfPost[row].selected == nil { arrayOfPost[row].selected = true
        } else {
            arrayOfPost[row].selected?.toggle()
        }
        postsTableView.reloadData()
    }
}


