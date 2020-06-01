//
//  Thumbnail.swift
//  Waiter
//
//  Created by Danny Boloban on 5/10/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import Foundation
import UIKit

class Thumbnail {
    var image: UIImage
    var title: String
    var price: String
    var description: String
    
    init(image: UIImage, title: String, price: String, descripcion: String) {
        self.image = image
        self.title = title
        self.price = price
        self.description = descripcion
    }

}
