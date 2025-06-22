//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI //*
import SwiftUI

struct ContentView: View {
    // Track the Image if there's an existing one.
    @State private var processedImage: Image?
    // Add a value to track the Intensity of the filter
    @State private var filterIntensity = 0.5
    
    // Track every picture selected
    // Optional, there isn't one by default
    @State private var selectedItem: PhotosPickerItem?
    
    
    // Select the filter
    @State private var currentFilter = CIFilter.sepiaTone()
    // Create a context
    let context = CIContext()
    
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
                    // If there's no image, Display a customized ContentUnavailableView
                    ContentUnavailableView("No picture", systemImage: "photo.badge.plus", description: Text("Import a photo to get started"))
                }
            }
            // To avoid having the systemImage to be blue (SwiftUI letting users know that the image is interactive) use buttonStyle plain
            .buttonStyle(.plain)
            .onChange(of: selectedItem, loadImage)
                Spacer()
            
            HStack{
                Text("Intensity")
                // Slider to adjust the Intensity of the filter
                Slider(value:$filterIntensity)
                    .onChange(of: filterIntensity, applyProcessing)
            }
            
            HStack{
                Button("Change Filter", action: changeFilter)
                    //change filter
                
                Spacer()
                
                    //share the picture
            }
            
        }
        // Use Arrays to customize .padding
        .padding([.horizontal, .bottom])
        .navigationTitle("Instafilter")
        
        
        }
    
    func changeFilter() {
        // code
        
    }
    
    func loadImage() {
        Task{
            
            // load data if there is one
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            
            // insert imageData into a UIImage
            guard let inputImage = UIImage(data: imageData) else { return }
            
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            
            applyProcessing()
            
            
        }
    }
    
    func applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)
        
        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }
        // .extent = Read it all
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
      
}

#Preview {
    ContentView()
}
