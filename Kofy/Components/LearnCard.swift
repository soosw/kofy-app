//
//  LearnCard.swift
//  Kofy
//
//  Created by Diego Gutierrez on 16/10/23.
//

import SwiftUI

struct LearnCard: View {
    var body: some View {
        ZStack {
            Color(.white)
            
            VStack {
                ZStack(alignment: .leading) {
                    Color(red: 0.956, green: 0.752, blue: 0.396)
//                    LinearGradient(colors: [Color(red: 0.956, green: 0.752, blue: 0.396), Color(.white)],
//                                   startPoint: .top,
//                                   endPoint: .bottom)
//                    .padding([.bottom], -30)
                    Text("Inhalador")
                        .font(Font.system(size: 25))
                        .bold()
                        .padding()
                }
                .frame(height: 50)
                
                Spacer()
                
                Image("learn1")
                    .resizable()
                    .scaledToFit()
                    .frame(height: .infinity)
                    .padding()
            }
        }
        .frame(width: 170, height: 170)
        .mask(RoundedRectangle(cornerRadius: 25.0))
    }
}

#Preview {
    LearnCard()
}
