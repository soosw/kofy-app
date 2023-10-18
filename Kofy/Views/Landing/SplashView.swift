//
//  SpashView.swift
//  Kofy
//
//  Created by Diego Gutierrez on 03/10/23.
//

import SwiftUI
import AVKit

struct PlayerView: UIViewRepresentable {
    let videoName: String
    let ext: String
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) {
    }
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, videoName: videoName, ext: ext)
    }
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    init(frame: CGRect, videoName: String, ext: String) {
        super.init(frame: frame)
        let player = AVPlayer(url: Bundle.main.url(forResource: videoName, withExtension: ext)!)
        player.actionAtItemEnd = .none
        player.play()
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
        
        layer.addSublayer(playerLayer)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: .zero, completionHandler: nil)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            PlayerView(videoName: "TextEncrypt", ext: "mp4")
                .edgesIgnoringSafeArea(.all)
            Image("KofyLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 170)
        }
    }
}

#Preview {
    SplashView()
}
