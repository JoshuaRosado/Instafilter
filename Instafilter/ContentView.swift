//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Use a ContentUnavailableView for when the data is not existing yet instead of returning a blank page.
        
        ContentUnavailableView{
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet")
        } actions: {
            Button("Create snippet"){
                
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
