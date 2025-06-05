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
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage(){
        let inputImage = UIImage(resource: .italy)
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        let currentFilter = CIFilter.dither()
        
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 1
        
        
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
