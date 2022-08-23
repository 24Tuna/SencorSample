//
//  SoundPlayer.swift
//  SencorSample
//
//  Created by cmStudent on 2022/08/12.
//

import Foundation
import AVFoundation
import UIKit

class SoundPlayer:NSObject,ObservableObject,AVAudioPlayerDelegate{
//    private let sound = try! AVAudioPlayer(data: NSDataAsset(name: "garagara")!.data)
    private var sound:AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "garagara", withExtension: "mp3")else{ return }
        sound = try! AVAudioPlayer(contentsOf: url)
        sound?.currentTime = 0.0
        sound?.play()
    }
    
    func stopSound(){
        sound?.stop()
    }
    
    //再生終了後に抽選処理を行う
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let value = Int.random(in: 1...10)
        print("抽選結果:",value)
    }
}
