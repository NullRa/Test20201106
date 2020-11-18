//
//  Page3ViewModel.swift
//  Test20201106
//
//  Created by Jay on 2020/11/9.
//

import Foundation

class Page3ViewModel {
    var idLblText: String!
    var titleLblText: String!
    var imageURL: URL!

    init(idText:String,titleText:String,url:URL){
        idLblText = idText
        titleLblText = titleText
        imageURL = url
    }
}
