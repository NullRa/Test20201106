//
//  Page1ViewModel.swift
//  Test20201106
//
//  Created by Jay on 2020/11/7.
//

//目標 base API: https://jsonplaceholder.typicode.com, end point: /photos
//https://jsonplaceholder.typicode.com/photos

import Foundation

class Page1ViewModel {
    let baseApi = BaseApi.shared

    func requestData() throws -> [ApiData] {
        return try baseApi.fetchApiData()
    }
}
