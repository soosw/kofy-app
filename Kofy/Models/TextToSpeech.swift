//
//  TextToSpeech.swift
//  Kofy
//
//  Created by Diego Gutierrez on 12/10/23.
//

import Foundation
import AVFoundation

protocol SpeechSynthesizerProviding {
    func speakText(_ text: String)
}

final class SpeechSynthesizer: SpeechSynthesizerProviding {
    let synthesizer = AVSpeechSynthesizer()
    
    func speakText(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "es-MX")
        synthesizer.speak(utterance)
    }
}

@MainActor
final class ContentViewModel: ObservableObject {
    @Published var text: String = ""
    
    let speechSynthesizer: SpeechSynthesizerProviding
    
    init(speechSynthesizer: SpeechSynthesizerProviding) {
        self.speechSynthesizer = speechSynthesizer
    }
    
    func textToSpeech() {
        speechSynthesizer.speakText(self.text)
    }
}
