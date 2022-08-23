//
//  SoundPlayer.swift
//  SencorSample
//
//  Created by cmStudent on 2022/08/12.
//

import Foundation
import AVFoundation
import UIKit

class SoundPlayer{
    private let sound = try! AVAudioPlayer(data: NSDataAsset(name: "garagara")!.data)
    
    func playSound(){
        sound.currentTime = 0.0
        sound.numberOfLoops = -1
        sound.play()
    }
    
    func stopSound(){
        sound.stop()
    }
}
