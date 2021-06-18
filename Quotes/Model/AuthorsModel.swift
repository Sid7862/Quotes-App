//
//  AuthorsModel.swift
//  Quotes
//
//  Created by Dheeraj Kumar Sharma on 17/06/21.
//

import Foundation

struct AuthorsModel: Decodable , Identifiable {
    
    let id = UUID()
    let totalCount: Int
    let page: Int
    let results: [Author]
    
    enum CodingKeys: String, CodingKey {
        case totalCount, page , results
    }
    
}

struct Author: Decodable , Identifiable {
    
    let id = UUID()
    let link: String
    let bio: String
    let description: String
    let _id: String
    let name: String
    let quoteCount: Int
    let slug: String
    
    enum CodingKeys: String, CodingKey {
        case link, bio , description , _id , name , quoteCount ,slug
    }
    
}
