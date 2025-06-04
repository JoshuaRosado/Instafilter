//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, world"){
            showingConfirmation.toggle()
        }
        .frame(width: 300, height: 300)
        .background(backgroundColor)
        // When the "var showingConfirmation" is triggered, open this confirmationDialog(small window with options)
        .confirmationDialog("Change background", isPresented: $showingConfirmation){
            
            // All the options in the confirmationDialog()
            Button("Red"){backgroundColor = .red}
            Button("Green"){backgroundColor = .green}
            Button("Blue"){backgroundColor = .blue}
            // Always give a straight forward way for users to close this confirmationDialog()
            Button("Cancel", role: .cancel){}

            
        } message: {
            // Description
            Text("Select a new color.")
        }
        
    }
}

#Preview {
    ContentView()
}
