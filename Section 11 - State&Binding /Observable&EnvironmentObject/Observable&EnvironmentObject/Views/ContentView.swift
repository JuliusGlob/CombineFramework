//
//  ContentView.swift
//  Observable&EnvironmentObject
//
//  Created by Julio Ismael Robles on 19/11/2021.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var fancyTimer = FanctyTimer()
    ///warning preview wont run because of this envornment object, but works fine if you run the app
    @EnvironmentObject var userSettings: UserSettings
    
    
    var body: some View {
        VStack {
            Text("\(self.fancyTimer.value)")
                .font(.largeTitle)
                .padding()
            Text("\(self.userSettings.score)")
                .padding()
            
            Button("Increment Score") {
                self.userSettings.score += 1
            }
            FancyScoreView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
