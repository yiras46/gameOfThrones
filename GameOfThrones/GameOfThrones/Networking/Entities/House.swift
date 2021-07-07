//
//  House.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import ObjectMapper

struct House:Mappable{
    
    var name: String?
    var region: String?
    var title: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        region  <- map["region"]
        title   <- map["title"]
    }
}
