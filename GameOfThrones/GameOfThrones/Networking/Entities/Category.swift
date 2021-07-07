//
//  Category.swift
//  GameOfThrones
//
//  Created by José Luis Fernández Mazaira on 05/07/21.
//

import ObjectMapper

struct Category:Mappable{
    
    var categoryName: String?
    var type: Int?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        categoryName  <- map["category_name"]
        type          <- map["type"]
    }
}

enum CategoryType : String{
    case Books = "Books"
    case Houses = "Houses"
    case Characters = "Characters"
}



