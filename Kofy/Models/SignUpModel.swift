//
//  SignUpModel.swift
//  Kofy
//
//  Created by Alumno on 13/10/23.
//

import Foundation

struct SignUpInformation : Identifiable {
    
    var id : UUID
    var username : String
    var email : String
    var password : String
    var type : Int
    
    init(id: UUID, username: String, email: String, password: String, type: Int) {
        self.id = id
        self.username = username
        self.email = email
        self.password = password
        self.type = type
    }
    
    init() {
        self.id = UUID()
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
