//
//  ContentView.swift
//  Instafilter
//
//  Created by Joshua Rosado Olivencia on 5/31/25.
//
import PhotosUI // STEP 1
import SwiftUI

struct ContentView: View {
    // STEP 2
    // Both are optional cause there's isn't one by default
    @State private var pickerItems = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        // STEP 3
        // Add a PhotoPicker View
        // Needs to have a "Title", Binding way to store the selection, some kind of filter for the data that needs to be loaded ( .images )
        VStack{
            // View
            // Filtering the types of images. Accepting any matching object except screenshots
            PhotosPicker( selection: $pickerItems,maxSelectionCount: 4, matching: .any (of: [.images, .not(.screenshots)])){
                Label("Select a picture", systemImage: "photo")
            }
            
            ScrollView{
                ForEach(0..<selectedImages.count, id: \.self){ i in
                    selectedImages[i]
                        .resizable()
                        .scaledToFit()
            }
                
            }
        }
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self){
                        selectedImages.append(loadedImage)
                    }
                }
            }
            
        }
    }
}
 

#Preview {
    ContentView()
}
