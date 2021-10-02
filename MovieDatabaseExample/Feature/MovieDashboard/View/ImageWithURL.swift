//
//  ImageWithURL.swift
//  MovieDatabaseExample
//
//  Created by Amit Majumdar on 26/09/21.
//

import SwiftUI
import MovieDatabase

struct ImageView<Placeholder>: View where Placeholder: View {
    
    var placeholder:() -> Placeholder
    
    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(@ViewBuilder placeholder: @escaping() -> Placeholder, url: String) {
        self.placeholder = placeholder
        imageLoader = ImageLoaderAndCache(imageURL: TMDBStore.pngImageURL + url)
    }
    
    var body: some View {
        if !imageLoader.isFinished {
            placeholder()
        } else {
            if let image = self.imageLoader.image {
                Image(uiImage: image)
                      .resizable()
                      .scaledToFill()
            } else {
                placeholder()
            }
        }
    }
}
