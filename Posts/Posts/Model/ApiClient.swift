//
//  ApiClient.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import Foundation
import Alamofire

class ApiClient {
    var postsArray: [Post] = []
    let url = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
    
   // var posts: Posts?
    func fetchPosts(handler: @escaping (Posts) -> Void) {
        AF.request(url)
            .responseDecodable(of: Posts.self,completionHandler: { response in
                if let value = response.value {
                    handler(value)
                    self.postsArray = value.posts
                }
            })
    }
}
