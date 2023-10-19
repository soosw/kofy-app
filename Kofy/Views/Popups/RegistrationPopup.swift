//
//  RegistrationPopup.swift
//  Kofy
//
//  Created by Diego Gutierrez on 18/10/23.
//

import SwiftUI
import HealthKit

struct RegistrationPopup: View {
    @State private var name = ""
    @State private var gender = ""
    @State private var bloodType = HKCharacteristicTypeIdentifier.bloodType.rawValue
    var body: some View {
        Text("Registration Popup")
    }
}

#Preview {
    RegistrationPopup()
}
