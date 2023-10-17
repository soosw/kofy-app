//
//  HistoryContentViewModel.swift
//  Kofy
//
//  Created by Diego Gutierrez on 14/10/23.
//

import Foundation

class HistoryContentViewModel : ObservableObject {
    @Published var history = [HistoryContentModel]()
    
    init() {
        loadHistory()
   }
    
    func loadHistory() {
        self.history.append(HistoryContentModel(doctor: "Dr. José Luis", description: "Cita con dermatólogo", date: "3/10/2023", color: 1))
        self.history.append(HistoryContentModel(doctor: "Dra. Sandra", description: "Cita con dentista", date: "2/09/2023", color: 2))
        self.history.append(HistoryContentModel(doctor: "Dr. José Luis", description: "Cita con dermatólogo", date: "3/10/2023", color: 3))
        self.history.append(HistoryContentModel(doctor: "Dra. Sandra", description: "Cita con dentista", date: "2/09/2023", color: 4))
    }
}
