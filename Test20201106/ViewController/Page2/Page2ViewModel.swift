//
//  Page2ViewModel.swift
//  Test20201106
//
//  Created by Jay on 2020/11/7.
//

import Foundation

class Page2ViewModel {
    var apiDatas:[ApiData]!
    init(apiDatas:[ApiData]){
        self.apiDatas = apiDatas
    }

    func getDatasCount() -> Int {
        return apiDatas.count
    }

    func getDataID(index:Int) -> Int {
        return apiDatas[index].id
    }

    func getDataTitle(index:Int) -> String {
        return apiDatas[index].title
    }

    func getDataThumbnailUrl(index:Int) -> URL {
        return apiDatas[index].thumbnailUrl
    }

    func getDataUrl(index:Int) -> URL {
        return apiDatas[index].url
    }
}
