//
//  FoodCell.swift
//  Waiter
//
//  Created by Danny Boloban on 5/10/20.
//  Copyright © 2020 JackWolf. All rights reserved.
//

import UIKit

class FoodCell: UITableViewCell {

    @IBOutlet weak var FoodImage: UIImageView!
    
    @IBOutlet weak var FoodTitle: UILabel!
    
    @IBOutlet weak var FoodPrice: UILabel!
    
    
    func setThumbnail(thumbnail: Thumbnail) {
        FoodImage.image = thumbnail.image
        FoodTitle.text = thumbnail.title
        FoodPrice.text = thumbnail.price
        /*let url = thumbnail.image
        let urlImage = URL(string: url)
        let task = URLSession.shared.dataTask(with: urlImage!) { data, response, error in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() {    // execute on main thread
                self.FoodImage.image = UIImage(data: data)
            }
        }
        task.resume()
        */
    }
}
