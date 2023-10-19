//
//  SignInViewModel.swift
//  Kofy
//
//  Created by Diego Gutierrez on 17/10/23.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    func verifySignIn(email: String, password: String) async throws {
        let signInData = SignInInformation(email: email, password: password)
        
        let url = URL(string: "https://kofy-back.onrender.com/user/login")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(signInData)
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                if let json = try? JSONSerialization.jsonObject(with: data) {
                    print(json)
                }
            } else {
                print("WTF?")
            }
        }
        task.resume()
        
    }
}
