//
//  CommentModel.swift
//  DataFromAPI
//
//  Created by Aqila Nasiry on 4/13/23.
//

import Foundation

class CommentsModel: Codable {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}
