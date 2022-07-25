//
//  ApiClient.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import Foundation
import Alamofire

class ApiClient {
//    var postsArray: [Post] = []
//    var presentationModelArray: [PostPresentation] = []
    let url = "https://raw.githubusercontent.com/anton-natife/jsons/master/api/main.json"
    
    
    func fetchPosts(handler: @escaping (Posts) -> Void) {
        AF.request(url)
            .responseDecodable(of: Posts.self,completionHandler: { response in
                if let value = response.value {
                    handler(value)
                }
            })
    }
    
    func fetchPost(urlString: String, handler: @escaping (PostNew) -> Void) {
        AF.request(urlString)
            .responseDecodable(of: PostNew.self, completionHandler: { response in
                if let value = response.value {
                    handler(value)
                    print(response.value?.post)
                }
                
            })
    }
}
