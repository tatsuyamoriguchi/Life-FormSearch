//
//  EOLController.swift
//  Life-FormSearch
//
//  Created by Tatsuya Moriguchi on 10/26/23.
//

import UIKit

extension Data {
    func prettyPrintedJSONString() {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []), let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted]), let prettryJSONString = String(data: jsonData, encoding: .utf8) else {
            print("Failed to read JSON obejct for prettyPrintedJSONString()")
            return
        }
        print(prettryJSONString)
                
    }
}

class EOLController {
    static let shared = EOLController()
    
    func sendRequest<Request: APIRequest>(_ request: Request) async throws -> Request.Response {
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw APIRequestError.itemNotFound
        }
        
        let decodeResponse = try request.decodeResponse(data: data)
        return(decodeResponse)
    }
}
