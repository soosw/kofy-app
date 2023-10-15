//
//  HistoryContentModel.swift
//  Kofy
//
//  Created by Diego Gutierrez on 14/10/23.
//

import Foundation

struct HistoryContentModel: Hashable, Codable, Identifiable {
    var id = UUID()
    var doctor: String
    var description: String
    var date: String
    var color: Int
}
