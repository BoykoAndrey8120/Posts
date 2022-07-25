//
//  Posts.swift
//  Posts
//
//  Created by Andrey Boyko on 22.07.2022.
//

import Foundation

struct Posts: Decodable {
    let posts: [Post]
}

struct Post: Decodable {
    let postId: Int?
    let timeshamp: Int?
    //var time: Date? = nil
    let title: String?
    let previewText: String?
    let likesCount: Int?
    //var selected: Bool? = false
    //var dayAgo: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case previewText = "preview_text"
        case likesCount = "likes_count"
        case postId
        case timeshamp
        case title
        //case selected
       // case dayAgo
    }
}


