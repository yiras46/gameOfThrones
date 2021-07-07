//
//  Character.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import ObjectMapper

struct Character:Mappable{
    
    var name: String?
    var gender: String?
    var died:String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        gender  <- map["gender"]
        died    <- map["died"]
    }
}
