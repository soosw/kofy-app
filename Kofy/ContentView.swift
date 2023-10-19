//
//  ContentView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 03/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var splashIsActive: Bool = true;
    
    var body: some View {
//        SignInView()
//        SignUpView()
//        HomeView()
        SpeechSessionView()
//        ZStack {
//            if self.splashIsActive {
//                SplashView()
//                    .onTapGesture {
//                        withAnimation {
//                            self.splashIsActive = false;
//                        }
//                    }
//            } else {
//                LandingView()
//            }
//        }
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
//                withAnimation {
//                    self.splashIsActive = false;
//                }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
