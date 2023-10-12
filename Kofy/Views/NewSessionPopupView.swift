//
//  NewSessionPopupView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 11/10/23.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    
    let radius: CGFloat
    let corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct NewSessionPopupView: View {
    // Form Inputs
    @State var sessionName = ""
    @State var sessionDescription = ""
    @State var sessionDoctor = ""
    @State var sessionDate = Date()
    
    @State var doctors = ["", "Dr.Oscar", "Dra.Sandra", "Dr.Emilio", "Dr.Pepe"]
    
    @Binding var popupIsShown: Bool
    @FocusState private var isInitiallyFocused: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                VStack {
                    HStack {
                        TextField("Nombre de la sesión", text: $sessionName, prompt: Text("Nueva Sesión").foregroundStyle(.gray))
                            .padding()
                            .font(Font.system(size: 28))
                            .bold()
                            .focused($isInitiallyFocused)
                            .onChange(of: popupIsShown, { oldValue, newValue in
                                if (newValue) {
                                    sessionName = ""
                                    sessionDescription = ""
                                    sessionDoctor = ""
                                    sessionDate = Date()
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        isInitiallyFocused = true;
                                   }
                                } else {
                                    isInitiallyFocused = false;
                                }
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
                    
                    VStack(alignment: .leading) {
                        TextField("Descripción de la sesión", text: $sessionDescription, prompt: Text("Descripción").foregroundStyle(.gray))
                            .padding([.leading])
                        
                        Picker("Escoja un doctor", selection: $sessionDoctor) {
                            ForEach(doctors, id: \.self) { item in
                                Text(item)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        DatePicker("Fecha de la sesión", selection: $sessionDate, displayedComponents: [.date])
                            .foregroundStyle(.gray)
                            .padding()
                    }
                    
                    HStack {
                        Button {
                            print("Sesión de escucha")
                        } label: {
                            Text("Escucha")
                        }
                        
                        Button {
                            print("Receta")
                        } label: {
                            Text("Receta")
                        }
                    }
                }
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .background(.white)
                .clipShape(RoundedCornersShape(radius: 16, corners: [.topLeft, .topRight]))
            }
            .edgesIgnoringSafeArea([.bottom])
        }
    }
}

#Preview {
    NewSessionPopupView(popupIsShown: .constant(true))
}
