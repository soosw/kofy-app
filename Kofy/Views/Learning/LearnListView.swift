//
//  LearnView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 14/10/23.
//

import SwiftUI

struct LearnListView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 0) {
                        Color(Color(red: 0.85, green: 0.85, blue: 0.85))
                            .ignoresSafeArea()
                            .frame(maxHeight: 0)
                        HStack {
                            Text("Lecciones")
                                .font(Font.system(size: 35, weight: .bold))
                                .foregroundStyle(Color(red: 0.278, green: 0.278, blue: 0.278))
                                .padding([.leading], 30)
                            Spacer()
                            Image("cucho")
                                .resizable()
                                .scaledToFit()
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .frame(width: 70)
                                .padding([.trailing], 10)
                        }
                        .padding(8)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                        .clipShape(
                            .rect(
                                bottomLeadingRadius: 20,
                                bottomTrailingRadius: 20
                            )
                        )
                    }
                    
                    Spacer()
                        
                    ScrollView {
                        LazyVGrid(columns: columns, alignment: .center, spacing: 15) {
                            ForEach(0..<4) { _ in
                                LearnCard()
                            }
                        }
                    }
                    .padding()
                }
            }
            .ignoresSafeArea(.keyboard)
            .frame(width: geometry.size.width)
        }
    }
}

#Preview {
    LearnListView()
}
