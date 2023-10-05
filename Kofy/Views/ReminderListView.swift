//
//  ReminderListView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 04/10/23.
//

import SwiftUI

class Reminder {
    var name: String
    var quantity: String
    var description: String
    
    init(name: String, quantity: String, description: String) {
        self.name = name
        self.quantity = quantity
        self.description = description
   }
}

struct ReminderListView: View {
    var reminders = [Reminder(name: "Paracetamol", quantity: "500g", description: "En 2 horas"), Reminder(name: "Ibuprofeno", quantity: "1g", description: "En 8.5 horas")];
    
    var body: some View {
        ScrollView {
            HStack {
                Image("pillsIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding([.leading, .trailing])
                VStack(alignment: .leading) {
                    Text(reminders[0].name)
                        .foregroundStyle(.black)
                        .font(Font.system(size: 22, weight: .bold))
                    Text(reminders[0].description)
                        .foregroundStyle(.black)
                        .font(Font.system(size: 15))
                }
                
                Text(reminders[0].quantity)
                    .foregroundStyle(.black)
                    .font(Font.system(size: 23, weight: .bold))
                
                Image("arrowIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            .background(.white)
            .cornerRadius(8)
            
            HStack {
                Image("pillsIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding([.leading, .trailing])
                VStack(alignment: .leading) {
                    Text(reminders[1].name)
                        .foregroundStyle(.black)
                        .font(Font.system(size: 22, weight: .bold))
                    Text(reminders[1].description)
                        .foregroundStyle(.black)
                        .font(Font.system(size: 15))
                }
                
                Text(reminders[1].quantity)
                    .foregroundStyle(.black)
                    .font(Font.system(size: 23, weight: .bold))
                
                Image("arrowIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
            }
            .background(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .greatestFiniteMagnitude)
    }
}

#Preview {
    ReminderListView()
}
