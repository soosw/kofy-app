//
//  NewDoctorPopupView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 12/10/23.
//

import SwiftUI

struct NewDoctorPopupView: View {
    @Binding var popupIsShown: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                VStack {
                    HStack {
                        Text("Nuevo Doctor")
                            .foregroundStyle(.gray)
                            .padding()
                            .font(Font.system(size: 28))
                            .bold()
                            .onChange(of: popupIsShown, { oldValue, newValue in
                                
                            })
                        
                        Spacer()
                        
                        Button {
                            popupIsShown.toggle()
                        } label: {
                            Image(systemName: "x.circle")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.gray)
                                .frame(width: 25, height: 25)
                                .padding()
                        }
                    }
                    .foregroundStyle(.black)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .padding([.bottom], 10)
                    
                    Button {
                        // Registar doctor aquí
                        popupIsShown.toggle()
                    } label: {
                        VStack {
                            Text("Registrar")
                                .bold()
                                .foregroundStyle(.white)
                                .font(Font.system(.title2))
                                .padding([.top, .bottom], 10)
                        }
                        .frame(width: geometry.size.width / 2)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .frame(width: geometry.size.width)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .background(.white)
                .clipShape(RoundedCornersShape(radius: 16, corners: [.topLeft, .topRight]))
            }
            .shadow(color: .gray, radius: 15, x: 0,  y: 8)
            .edgesIgnoringSafeArea([.bottom])
        }
    }
}

#Preview {
    NewDoctorPopupView(popupIsShown: .constant(true))
}
