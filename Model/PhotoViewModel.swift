//
//  PhotoViewModel.swift
//  Navigation
//
//  Created by gleb on 08/06/2023.
//

import Foundation

final class PhotoViewModel {
    var ImagesArray: [PostImage]
    
    var ImageNames: [PostImage]? {
        didSet {
            self.imageNameDidChenge?(self)
        }
    }
    
    init(model: [PostImage]) {
        self.ImagesArray = model
    }
    
    var imageNameDidChenge: ((PhotoViewModel) -> ())?
    
    func showMagic() {
        ImageNames = ImagesArray
    }
}
