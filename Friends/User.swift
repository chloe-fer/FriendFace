//
//  User.swift
//  Friends
//
//  Created by Chloe Fermanis on 28/8/20.
//  Copyright © 2020 Chloe Fermanis. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var friends: [Friend]
    
    var formatAddress: [String] {
        address.components(separatedBy: ",")
    }
    
    var formatDate: String {
        let date = registered.components(separatedBy: "-")
        return date[0]
    }
    
}
