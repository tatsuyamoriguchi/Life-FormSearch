//
//  EOLItem.swift
//  Life-FormSearch
//
//  Created by Tatsuya Moriguchi on 10/26/23.
//

import Foundation

struct EOLItem: Codable {
    var itemPerPage: Int
    var results: [resultsArray]
    var totalResults: Int
    var startIndex: Int
    
}

struct resultsArray: Codable {
    var id: Int
    var title: String
    var content: String
    var link: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title = "scientificName"
        case content = "commonName"
        case link
    }
}
