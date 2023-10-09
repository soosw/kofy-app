//
//  HistoryListView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 09/10/23.
//

import SwiftUI

class HistoryContent {
    var doctor: String
    var description: String
    var date: String
    
    init(doctor: String, description: String, date: String) {
        self.doctor = doctor
        self.description = description
        self.date = date
   }
}

struct HistoryListView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var history = [HistoryContent(doctor: "Dr. José Luis", description: "Cita con dermatólogo", date: "3/10/2023"), HistoryContent(doctor: "Dra. Sandra", description: "Cita con dentista", date: "2/09/2023")]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns) {
                    // INICIO DE TARJETA
                    ZStack {
                        Color(Color(red: 0.34, green: 0.34, blue: 0.34))
                        VStack {
                            Color(.red)
                            Text(history[0].doctor)
                                .font(Font.system(size: 21, weight: .bold))
                            Text(history[0].description)
                            Text(history[0].date)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    // FIN DE TARJETA
                }
            }
        }
    }
}

#Preview {
    HistoryListView()
}
