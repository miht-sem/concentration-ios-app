//
//  Card.swift
//  Concentration
//
//  Created by Семен Михтанюк on 09.07.2021.
//

import Foundation

struct Card {
    
    var isFaceUp = false
    var isMatched = false
    var isDelete = false
    var indentifier: Int
    
    
    private static var indentifierNumber = 0
    
    private static func indentifierGenerator() -> Int {
        indentifierNumber += 1
        return indentifierNumber
    }
    
    init(){
        self.indentifier =  Card.indentifierGenerator()
    }
}
