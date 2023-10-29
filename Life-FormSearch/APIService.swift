//
//  APIService.swift
//  Life-FormSearch
//
//  Created by Tatsuya Moriguchi on 10/26/23.
//

import UIKit

struct EOLSearchAPIRequest: APIRequest {

    let searchTerm: String

    var urlRequest: URLRequest {
        let query = [
            "q": searchTerm,
            "page": "1",
        ]
        
        var urlComponensts = URLComponents(string: "https://eol.org/api/search/1.0.json")!
        urlComponensts.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        return URLRequest(url: urlComponensts.url!)
    }
    
    func decodeResponse(data: Data) throws -> SearchResponse {
        let decoder = JSONDecoder()
        let searchResponse = try decoder.decode(SearchResponse.self, from: data)
        return searchResponse
    }
}

struct EOLItemDetailAPIRequest: APIRequest {
    
    let item: EOLItem
    
    var urlRequest: URLRequest {
        let query = [
            "images_per_page": "1",
            "language": "en",
            "taxnomy": "true"
        ]
        
        print("https://eol.org/api/pages/1.0/" + "\(item.id)" + ".json")
        var urlComponents = URLComponents(string: "https://eol.org/api/pages/1.0/" + "\(item.id)" + ".json")!
        urlComponents.queryItems = query.map{ URLQueryItem(name: $0.key, value: $0.value) }
        return URLRequest(url: urlComponents.url!)
    }
    
    func decodeResponse(data: Data) throws -> EOLItemDetail {
        let decoder = JSONDecoder()
        let itemDetail = try decoder.decode(EOLItemDetail.self, from: data)
        return itemDetail
    }
}




struct EOLHierarchyAPIRequest: APIRequest {
    let identifier: Int

    var urlRequest: URLRequest {
        let query = [
            "language": "en"
        ]
        
        var urlComponents = URLComponents(string: "https://eol.org/api/hierarchy_entries/1.0/" + "\(identifier)" + ".json")!
        urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        return URLRequest(url: urlComponents.url!)
                                                            
    }
    
    func decodeResponse(data: Data) throws -> EOLHierarchy {
        let decoder = JSONDecoder()
        let itemDetail = try decoder.decode(EOLHierarchy.self, from: data)
        return itemDetail
    }
}

struct EOLImageAPIRequest: APIRequest {
    enum ResponseError: Error {
        case invalidImageData
    }
    
    let url: URL
    var urlRequest: URLRequest {
        return URLRequest(url: url)
    }
    
    func decodeResponse(data: Data) throws -> UIImage {
        guard let image = UIImage(data: data) else {
            throw ResponseError.invalidImageData
        }
        return image
    }
    
}




