//
//  HistoryView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 14/10/23.
//

import SwiftUI

struct HistoryView: View {
    @Namespace var namespace
    @State var showExpanded = false
    
    @State var content: HistoryContentModel
    var cardColors = ["CardColor0", "CardColor1", "CardColor2", "CardColor3", "CardColor4", "CardColor5"]

    var body: some View {
        if (!showExpanded) {
            // INICIO DE TARJETA
            ZStack(alignment: .leading) {
                LinearGradient(colors: [Color(cardColors[content.color]), Color(red: 0.34, green: 0.34, blue: 0.34)],
                               startPoint: .top,
                               endPoint: .center)
                .matchedGeometryEffect(id: "colorHeader", in: namespace, properties: [.size, .position], isSource: true)
                VStack(alignment: .leading, spacing: 3) {
                    Text(content.doctor)
                        .font(Font.system(size: 21, weight: .bold))
                        .matchedGeometryEffect(id: "title", in: namespace, properties: .size, isSource: true)
                    Text(content.description)
                        .font(Font.system(size: 13))
                        .matchedGeometryEffect(id: "description", in: namespace, properties: .size, isSource: true)
                    Text(content.date)
                        .font(Font.system(size: 13))
                        .foregroundStyle(.yellow)
                        .matchedGeometryEffect(id: "date", in: namespace, properties: .size, isSource: true)
                }
                .padding(10)
                .padding([.top], 60)
            }
            .frame(width: 170, height: 170)
            .clipShape(RoundedRectangle(cornerRadius: 25.0))
            .onTapGesture {
                withAnimation {
                    showExpanded.toggle()
                }
            }
            // FIN DE TARJETA
        } else {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack {
                    ZStack(alignment: .leading) {
                        LinearGradient(colors: [Color(cardColors[content.color]), Color("BackgroundColor")],
                                       startPoint: .top,
                                       endPoint: .bottom)
                        .matchedGeometryEffect(id: "colorHeader", in: namespace, properties: [.size, .position])
                        
                        HStack {
                            Button(action: {
                                withAnimation {
                                    showExpanded.toggle()
                                }
                            }) {
                                Image(systemName: "chevron.backward")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .bold()
                                    .foregroundStyle(.gray)
                            }
                            .padding([.leading])
                            .offset(y: -15)
                            
                            VStack(alignment: .leading) {
                                Text(content.doctor)
                                    .font(Font.system(size: 35, weight: .bold))
                                    .matchedGeometryEffect(id: "title", in: namespace, properties: .frame)
                                
                                VStack(alignment: .leading, spacing: 3) {
                                    HStack {
                                        Image(systemName: "pencil")
                                        Text(content.description)
                                            .font(Font.system(size: 15))
                                            .matchedGeometryEffect(id: "description", in: namespace, properties: .size)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "person")
                                        Text(content.doctor)
                                            .font(Font.system(size: 15))
                                            .matchedGeometryEffect(id: "doctor", in: namespace, properties: .size)
                                    }
                                    
                                    HStack {
                                        Image(systemName: "calendar")
                                        Text(content.date)
                                            .font(Font.system(size: 15))
                                            .foregroundStyle(.yellow)
                                            .matchedGeometryEffect(id: "date", in: namespace, properties: .size)
                                    }
                                }
                                .offset(x: 10)
                            }
                            .padding([.top], 30)
                        }
                    }
                    .frame(height: 200)
                    
                    Spacer()
                    
                    VStack {
                        Text("Sesión de escucha")
                    }
                }
                .ignoresSafeArea()
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HistoryView(content: HistoryContentModel(doctor: "Dr. José Luis", description: "Cita con dermatólogo", date: "3/10/2023", color: 2))
}
