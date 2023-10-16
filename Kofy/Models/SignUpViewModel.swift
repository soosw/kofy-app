//
//  SignUpViewModel.swift
//  Kofy
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject{
    
    @Published var signUpData = SignUpInformation()
    
    func registerSignUpData(username: String, email: String, password: String, type: Int) async throws{
        signUpData.username = username
        signUpData.email = email
        signUpData.password = password
        signUpData.type = type
        
        //let body: [String: Any] = ["id": id, "first_name": first_name, "last_name": last_name, "birthday": birthday, "phone_number": phone_number, "create_date": create_date, "updated_date": updated_date, "address": address]
                
        let jsonData = try? JSONSerialization.data(withJSONObject: signUpData)
        
        //  "https://flaskcontact-list-app.herokuapp.com/contacts"
        let url = URL(string: "https://kofy-back.onreader.com/user/register")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let(data, response) = try await URLSession.shared.data(for: request)
        
        guard(response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        print("exito")
        
        //let results = try JSONDecoder().decode(signUpData.self, from:data)
    }
    
}
