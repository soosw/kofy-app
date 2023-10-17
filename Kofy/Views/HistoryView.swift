//
//  HistoryView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 14/10/23.
//

import SwiftUI

struct HistoryView: View {
    var namespace: Namespace.ID
    @Binding var shown: Bool
    @Binding var disabledTouch: Bool
    
    @State var content: HistoryContentModel
    var cardColors = ["CardColor0", "CardColor1", "CardColor2", "CardColor3", "CardColor4", "CardColor5"]

    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                ZStack(alignment: .leading) {
                    LinearGradient(colors: [Color(cardColors[content.color]), Color("BackgroundColor")],
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .matchedGeometryEffect(id: "colorHeader", in: namespace)
                    
                    HStack {
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.35)) {
                                shown.toggle()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                disabledTouch.toggle()
                            }
                        }) {
                            Image(systemName: "chevron.backward")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .bold()
                                .foregroundStyle(.gray)
                        }
                        .padding([.leading])
                        .offset(y: -15)
                        
                        VStack(alignment: .leading) {
                            Text(content.doctor)
                                .font(Font.system(size: 35, weight: .bold))
                                .matchedGeometryEffect(id: "title", in: namespace)
                            
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
        .mask(
            RoundedRectangle(cornerRadius: 25.0)
                .matchedGeometryEffect(id: "roundedShape", in: namespace)
        )
        .ignoresSafeArea()
    }
}

#Preview {
    @Namespace var namespace
    
    return HistoryView(namespace: namespace, shown: .constant(true), disabledTouch: .constant(true), content: HistoryContentModel(doctor: "Dr. José Luis", description: "Cita con dermatólogo", date: "3/10/2023", color: 2))
}
