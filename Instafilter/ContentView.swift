//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View{
    
    @State private var image: Image?
    var body: some View {
        VStack{
            image?
                .resizable()
                
                
        }
        .ignoresSafeArea()
        .onAppear(perform: loadImage)
    }
    
    func loadImage(){
        // load our Image into a UIImage
        let inputImage = UIImage(resource: .italy)
        // put inputImage into a CIImage
        let beginImage = CIImage(image: inputImage)
        
        
        // make our context
        let context = CIContext()
        // make our filter, select our filter
        let currentFilter = CIFilter.dither()
        
        //
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 0.5
        
        // guard = exit before it fails
        guard let outputImage = currentFilter.outputImage else { return}
        
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
        else {return}
        
        
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage: uiImage)
        
        
    }
}

#Preview {
    ContentView()
}
