//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    var body: some View {
        VStack{
            Spacer()
            //image area
            if let processedImage {
                processedImage
                    .resizable()
                    .scaledToFit()
            } else {
                ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
            }
            Spacer()
            
            HStack{
                Text("Intensity")
                Slider(value:$filterIntensity)
            }
            
            HStack{
                Button("Change Filter", action: changeFilter)
                    //change filter
                
                Spacer()
                
                    //share the picture
            }
            
        }
        .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
        
        
        }
    
    func changeFilter() {
        
    }
      
}

#Preview {
    ContentView()
}
