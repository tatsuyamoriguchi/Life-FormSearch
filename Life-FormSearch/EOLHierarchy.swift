//
//  EOLHierarchy.swift
//  Life-FormSearch
//
//  Created by Tatsuya Moriguchi on 10/26/23.
//

import Foundation

struct Ancestor: Codable {
    var scientificName: String
    var taxonRank: String?
}

struct EOLHierarchy: Codable {
    var ancestors: [Ancestor]?
}
