//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            //
            Slider(value: $blurAmount, in : 0...20)
            // When blurAmount updates,  return old and new value
            // and print new value
                .onChange(of: blurAmount) {oldValue, newValue in
                    print("New value is \(newValue)")
                }
        }
        
    }
}

#Preview {
    ContentView()
}
