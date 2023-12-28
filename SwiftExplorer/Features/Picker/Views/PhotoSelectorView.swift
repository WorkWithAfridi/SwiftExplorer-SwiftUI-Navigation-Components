//
//  PhotoSelectorView.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 28/12/23.
//

import SwiftUI
import PhotosUI

struct PhotoSelectorView: View {
    @StateObject var vm = PhotoSelectorController()
    let maxPhotosToSelect = 10
    
    @State private var selectedItem: PhotosPickerItem?
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            PhotosPicker("Select single image", selection: $selectedItem, matching: .images)
                .onChange(of: selectedItem) {
                    Task {
                        if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                            image = UIImage(data: data)
                        }
                        print("Failed to load the image")
                    }
                }
            if !vm.images.isEmpty{
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.fixed(300))]) {
                        ForEach(0..<vm.images.count, id: \.self) { index in
                            Image(uiImage: vm.images[index])
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            PhotosPicker(
                selection: $vm.selectedPhotos, // holds the selected photos from the picker
                maxSelectionCount: maxPhotosToSelect, // sets the max number of photos the user can select
                selectionBehavior: .ordered, // ensures we get the photos in the same order that the user selected them
                matching: .images // filter the photos library to only show images
            ) {
                // this label changes the text of photo to match either the plural or singular case based on the value in maxPhotosToSelect
                Label("Select up to ^[\(maxPhotosToSelect) photo](inflect: true)", systemImage: "photo")
            }
        }
        .padding()
        .onChange(of: vm.selectedPhotos) { _, _ in
            vm.convertDataToImage()
        }
    }
}

#Preview {
    PhotoSelectorView()
}
