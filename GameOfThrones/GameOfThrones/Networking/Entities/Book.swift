//
//  Book.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import ObjectMapper

struct Book:Mappable{
    
    var name: String?
    var isbn: String?
    var country: String?
    var publisher: String?
    var mediaType: String?
    var released:String?
    var numberOfPages:Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name            <- map["name"]
        isbn            <- map["isbn"]
        country         <- map["country"]
        publisher       <- map["publisher"]
        mediaType       <- map["mediaType"]
        released        <- map["released"]
        numberOfPages   <- map["numberOfPages"]
    }
}

