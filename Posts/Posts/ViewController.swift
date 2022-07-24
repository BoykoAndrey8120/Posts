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
    var array: [Post] = []
  
 
    @IBAction func tapSortButton(_ sender: Any) {
        let alert = UIAlertController(title: "Title", message: "Please Select an Option", preferredStyle: .actionSheet)
            
            alert.addAction(UIAlertAction(title: "Sort feed by rating", style: .default , handler:{ (UIAlertAction)in
                self.array.sort{
                    $0.likesCount ?? 0 > $1.likesCount ?? 0 }
                self.postsTableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Sort feed by date", style: .default , handler:{ (UIAlertAction)in
                self.array.sort{
                    $0.timeshamp ?? 0 > $1.timeshamp ?? 0 }
                self.postsTableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
                
            }))

            self.present(alert, animated: true, completion: {
                print("completion block")
            })
    }
    
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


