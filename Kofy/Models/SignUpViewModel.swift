//
//  SignUpViewModel.swift
//  Kofy
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject{
    
    @Published var signUpData = SignUpInformation()
    
    func registerSignUpData(id: UUID, username: String, email: String, password: String, type: Int){
        signUpData.id = id
        signUpData.username = username
        signUpData.email = email
        signUpData.password = password
        signUpData.type = type
    }
    
}
