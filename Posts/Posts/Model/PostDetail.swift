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

struct PostDetail: Decodable {
   let post: News
}
    
    struct News: Decodable {
    let postId: Int?
    let timeshamp: Int?
    let title: String?
    let text: String?
    let postImage: String?
    let likesCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case postId
            case timeshamp
            case title
            case text
            case postImage
            case likesCount = "likes_count" 
        }
}
