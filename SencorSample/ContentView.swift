//
//  ContentView.swift
//  SencorSample
//
//  Created by cmStudent on 2022/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var manager = MotionManager()
    
    var body: some View {
        let x = String($manager.accelX.wrappedValue)
        let y = String($manager.accelY.wrappedValue)
        let z = String($manager.accelZ.wrappedValue)
        VStack{
//            Text("")
            Text(x)
                .padding()
            Text(y)
                .padding()
//            Text(z)
//                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
