//
//  BaseApi.swift
//  Test20201106
//
//  Created by Jay on 2020/11/7.
//

import Foundation

struct ApiData: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: URL
    let thumbnailUrl: URL
}

class BaseApi {
    static let shared = BaseApi()

    let baseApi = "https://jsonplaceholder.typicode.com"
    let endPoint = "/photos"

    func fetchApiData() throws -> [ApiData] {
        let apiURLString = baseApi+endPoint
        let data: Data = try self.fetchJsonData(apiURL: apiURLString)
        let decoder = JSONDecoder()
        return try decoder.decode([ApiData].self, from: data)
    }

    internal func fetchJsonData(apiURL: String) throws -> Data {
        let url = URL(string: apiURL)
        let request = URLRequest(url: url!)
        let sema = DispatchSemaphore( value: 0)

        var currentData: Data = Data()
        let completionHandler = {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            currentData = data!
            sema.signal()
        }
        URLSession.shared.dataTask(with: request, completionHandler: completionHandler).resume()
        sema.wait()

        return currentData
    }
}
