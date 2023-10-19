//
//  SignInModel.swift
//  Kofy
//
//  Created by Diego Gutierrez on 17/10/23.
//

import Foundation

struct SignInInformation : Encodable {
    var email : String
    var password : String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    init() {
        self.email = " "
        self.password = " "
    }
}
