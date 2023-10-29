//
//  EOLItem.swift
//  Life-FormSearch
//
//  Created by Tatsuya Moriguchi on 10/26/23.
//

import Foundation

struct EOLItem: Codable {
    
    var commonName: String
    var scientificName: String
    var id: Int
    
    enum CodingKeys: String, CodingKey {
        case commonName = "content"
        case scientificName = "title"
        case id
    }
}

struct SearchResponse: Codable {
    let results: [EOLItem]
}
