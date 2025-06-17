//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

// STEP 1
import StoreKit //*
import SwiftUI

struct ContentView: View {
    // STEP 2
    // ADD Property to read the review requester from SwiftUI's environment
    @Environment(\.requestReview) var requestReview
    var body: some View {
        Text("Instafilter")
        
        // STEP 3
        // Need to request a review when ready
        
        Button("Leave a review"){
            requestReview()
        }
    }
}
#Preview {
    ContentView()
}
