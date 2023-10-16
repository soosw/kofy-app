//
//  SignUpModel.swift
//  Kofy
//
//  Created by Alumno on 13/10/23.
//

import Foundation

struct SignUpInformation {
    
    var username : String
    var email : String
    var password : String
    var type : Int
    
    init(id: UUID, username: String, email: String, password: String, type: Int) {
        self.username = username
        self.email = email
        self.password = password
        self.type = type
    }
    
    init() {
        self.username = " "
        self.email = " "
        self.password = " "
        self.type = 0
    }
    
    enum CodingKeys : String, CodingKey {
        case index
        case name
        case url
    }
    
}
