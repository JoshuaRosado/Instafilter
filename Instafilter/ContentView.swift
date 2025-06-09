//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//



// To create a Core Image context and a Core Image filter.
import CoreImage // x
import CoreImage.CIFilterBuiltins // x
import SwiftUI



// UIImage = UIKit
// CGImage = Core Graphics
// CIImage = Core Image

// UIImage = Extreme powerful image type capable of working with a variety of image types(PNG, SVG) and even sequences that form an animation. UIImage is the standard imge type for UIKit, and of the three it's the closest to SwiftUI's Image type.

// CGImage = which comes from Core Graphics. This i a simpler image type that is really just a two-dimensional array of pixels.

// CIImage = which comes from Core Image. This stores all the information required to produce an image but doesn't actually turn that pixels unless it's asked to. Apple calls CIImage " an image recipe" rather than an actual image.



struct ContentView: View{
    // Use optional Image
    @State private var image: Image?
    var body: some View {
        VStack{
            image? // If there's an image, display it
            //modifiers
                .resizable()
                .scaledToFit()
                
                
        }
        .ignoresSafeArea()
        // When View appears perform loadImage method
        .onAppear(perform: loadImage) // If there's no existing image, it won't trigger the onAppear() function
        
    }
    // Loading method
    func loadImage(){
        // Grab our image
        // Load our Image into a UIImage
        let inputImage = UIImage(resource: .italy)
        
        // Manipulate it using Core Image
        // This is what Core Image wants to work with
        let beginImage = CIImage(image: inputImage)
        
        
        // Create a context
        let context = CIContext()
        // Create our filter and select
        let currentFilter = CIFilter.dither() //CIFilter."Filter Selected"
        
        // Customize our filter
        currentFilter.inputImage = beginImage
        currentFilter.intensity = 0.3
        
        // Guard = exit before it fails
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
