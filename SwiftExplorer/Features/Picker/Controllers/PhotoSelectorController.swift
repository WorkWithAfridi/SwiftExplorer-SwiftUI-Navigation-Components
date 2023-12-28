//
//  PhotoSelectorController.swift
//  SwiftExplorer
//
//  Created by Khondakar Afridi on 28/12/23.
//

import Foundation
import SwiftUI
import PhotosUI

class PhotoSelectorController: ObservableObject {
    @Published var images = [UIImage]()
    @Published var selectedPhotos = [PhotosPickerItem]()
    
    @MainActor
    func convertDataToImage() {
        // reset the images array before adding more/new photos
        images.removeAll()
        
        if !selectedPhotos.isEmpty {
            for eachItem in selectedPhotos {
                Task {
                    if let imageData = try? await eachItem.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }
        
        // uncheck the images in the system photo picker
        selectedPhotos.removeAll()
    }
}
