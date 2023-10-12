//
//  SpeechSessionView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 11/10/23.
//

import SwiftUI

struct SpeechSessionView: View {
    @State var sessionAnswer = ""
    @State var sessionName = "Nueva Sesión"
//    @State var sessionText = "Hola Gerardo, buenos días. Recuerdo que la última vez que nos vimos me comentaste que tenías"
    
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State private var isListening = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text(sessionName)
                    .font(Font.system(size: 35))
                    .bold()
                    .foregroundStyle(.gray)
                    .padding([.leading, .top])
                    .padding([.bottom], -1)
                VStack {
                    Color(red: 0.313, green: 0.313, blue: 0.313)
                        .frame(width: geometry.size.width / 1.3, height: 4)
                        .cornerRadius(.infinity)
                }
                .padding([.leading], 15)
                .padding([.bottom], 2)

                ScrollView {
                    Text(speechRecognizer.transcript)
                        .font(Font.system(size: 28))
                        .lineSpacing(6)
                        .bold()
                        .padding()
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                    Button() {
                        if !isListening {
                            speechRecognizer.transcribe()
                        } else {
                            speechRecognizer.stopTranscribing()
                        }
                        
                        isListening.toggle()
                    } label: {
                        ZStack {
                            Color(.white)
                            Image(systemName: isListening ? "square.fill" : "play.fill")
                                .foregroundStyle(.black)
                        }
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 50)
                    }
                    .frame(height: 60)
                    
                    ZStack {
                        Color(red: 0.16, green: 0.16, blue: 0.16)
                            .cornerRadius(.infinity)
                        TextField("Respuesta", text: $sessionAnswer)
                            .padding()
                    }
                    .padding()
                    .frame(height: 60)
                }
                .frame(maxWidth: geometry.size.width)
            }
        }
    }
}

#Preview {
    SpeechSessionView()
}
