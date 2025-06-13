//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    // Sharing image
    let example = Image(.italy)
    
    var body: some View {
        
        // *Sharing URL
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!){
//            Label("Spread the word about hacking with swift", systemImage: "swift")
//        }
        
        
        // *Sharing Image
        
        ShareLink(item: example, preview: SharePreview("Italy", image: example)){
            Label("Share", systemImage: "airplane")
        }
    }
}

#Preview {
    ContentView()
}
