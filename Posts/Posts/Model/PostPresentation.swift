//
//  PostPresentation.swift
//  Posts
//
//  Created by Andrey Boyko on 24.07.2022.
//

import Foundation
struct PostPresentation {
    let id: Int?
    let title: String?
    let previewText: String?
    let likesCount: Int?
    var selected: Bool?
    var dayAgo: String?
    
    init(post: Post) {
        id = post.postId
        title = post.title
        previewText = post.previewText
        likesCount = post.likesCount
        selected = false
        dayAgo = Date().timeAgoDisplay(time: post.timeshamp)
    }
}
