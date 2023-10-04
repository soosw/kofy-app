//
//  LandingView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 03/10/23.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image("KofyLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 170)
                        Text("KOFY")
                            .font(Font.custom("ZenTokyoZoo-Regular", size: 50))
                            .foregroundColor(.white)
                    }
                    .padding([.top], 50)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        // Login Button
                        Button {
                            print("Iniciar Sesión")
                        } label: {
                            Text("Iniciar Sesión")
                                .frame(width: geometry.size.width / 2)
                        }
                        .padding()
                        .background(Color(red: 0.156, green: 0.156, blue: 0.156))
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .bold()
                        .overlay(
                            RoundedRectangle(cornerRadius: .infinity)
                                .stroke(.white, lineWidth: 3)
                        )
                        
                        
                        // Register Button
                        Button {
                            print("Registrarme")
                        } label: {
                            Text("Registrarme")
                                .frame(width: geometry.size.width / 2)
                        }
                        .padding()
                        .background(Color(red: 0.556, green: 0.478, blue: 0.996))
                        .cornerRadius(.infinity)
                        .foregroundColor(.white)
                        .bold()
                        .overlay(
                            RoundedRectangle(cornerRadius: .infinity)
                                .stroke(.white, lineWidth: 3)
                        )
                    }
                    .padding([.bottom], 30)
                    .frame(width: geometry.size.width / 2)
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

#Preview {
    LandingView()
}
