//
//  PostNew.swift
//  Posts
//
//  Created by Andrey Boyko on 24.07.2022.
//

import Foundation

//struct PostDictionary: Decodable {
//    let post: [String: Any]
//}

struct PostNew: Decodable {
   let post: News
}
    
    struct News: Decodable {
    
    let postId: Int?
    let timeshamp: Int?
    let title: String?
    let text: String?
    let postImage: String?
    let likes_count: Int?
}
