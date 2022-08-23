//
//  ViewModel.swift
//  SencorSample
//
//  Created by cmStudent on 2022/07/25.
//

import CoreMotion
import UIKit

final class MotionManager:NSObject,ObservableObject{
    
    let player = SoundPlayer()
    
    var decision = false
    
    var saveAccelX = 0.0
    var saveAccelY = 0.0
    var saveAccelZ = 0.0
    
    @Published var accelX = 0.0
    @Published var accelY = 0.0
    @Published var accelZ = 0.0
    
    let manager = CMMotionManager()
//    let queue = OperationQueue()
    
    override init(){
        super.init()
        
        
        
        if manager.isAccelerometerAvailable{
        manager.accelerometerUpdateInterval = 20.0/60.0
        manager.startAccelerometerUpdates(
            to: OperationQueue.current!,
            withHandler:{
                (accelData: CMAccelerometerData?, errorOC: Error?) in
                self.accelX = floor((accelData?.acceleration.x ?? 0.0) * 100000) / 100000
                self.accelY = floor((accelData?.acceleration.y ?? 0.0) * 100000) / 100000
                self.accelZ = floor((accelData?.acceleration.z ?? 0.0) * 100000) / 100000
                
                if fabs(fabs(self.accelX) - fabs(self.saveAccelX)) >= 0.05 &&
                    fabs(fabs(self.accelY) - fabs(self.saveAccelY)) >= 0.05{
                    
                    if !self.decision{
                        print("PlaySound:1")
                        self.player.playSound()
                        self.decision = true
                    }
                    
                }else if fabs(fabs(self.saveAccelX) - fabs(self.accelX)) >= 0.05 &&
                         fabs(fabs(self.saveAccelY) - fabs(self.accelY)) >= 0.05{
                    
                    if !self.decision{
                        print("PlaySound:2")
                        self.player.playSound()
                        self.decision = true
                    }
                    
                }else{
                    print("StopSound")
                    self.decision = false
                    self.player.stopSound()
                }
                
                print("x:",self.accelX)
                print("y:",self.accelY)
                print()
                
                
            })
        }
    }
    
}
