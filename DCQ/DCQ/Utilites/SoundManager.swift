//
//  SoundManager.swift
//  DCQ
//
//  Created by Mirna Helmy on 11/7/22.
//

import Foundation
import AVKit


class SoundManager: ObservableObject {
    
    
    var playerC: AVAudioPlayer?
    
    
    func doMusic() {
        if let playerC = playerC, playerC.isPlaying {
            playerC.stop()
        } else {
            let path = Bundle.main.path(forResource: "backgroundMusic", ofType: "mp3")
            
            do {
                try AVAudioSession.sharedInstance().setMode(.default)
                try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
                
                guard let path = path else { return }
                
                playerC = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                
                
                guard let playerC = playerC else { return }
                playerC.play()
            } catch {
                print("ERROR: Could not find sound file!")
            }
            
        }
    }
}


