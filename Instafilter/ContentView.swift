//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    // Track every picture selected
    // Optional, there isn't one by default
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        VStack{
            Spacer()
            // Add a PhotosPicker view to trigger an image selection
            //image area
            PhotosPicker(selection: $selectedItem){
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                }
            }
            .buttonStyle(.plain)
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
    
    func loadImage() {
        Task{
            
            // load data if there is one
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            
            // insert imageData into a UIImage
            guard let inputImage = UIImage(data: imageData) else { return }
            
            
        }
    }
      
}

#Preview {
    ContentView()
}
