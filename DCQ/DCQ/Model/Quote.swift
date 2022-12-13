//
//  Quote.swift
//  DCQ
//
//  Created by Mirna Helmy on 10/12/22.
//

import Foundation

struct Quote: Identifiable, Codable, Hashable{
    
    let id: String = UUID().uuidString
    let title: String?
    let body: String
    let author: String
    var isFaved: Bool? = false
    

    
}



