import Combine
import SDWebImage

class ImageLoaderAndCache: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isFinished: Bool = false

    init(imageURL: String) {
        if let url = URL(string: imageURL) {
            SDWebImageManager
                .shared
                .loadImage(with: url,
                           options: .highPriority,
                           progress: nil) { (image, data, error, cacheType, isFinished, imageURL) in
                if error == nil {
                    DispatchQueue.main.async {
                        self.image = image
                        self.isFinished = isFinished
                    }
                }
            }
        }
    }
}
