//
//  WILImageTableViewCell.swift
//  DogsC
//
//  Created by William Moody on 5/22/19.
//  Copyright © 2019 William Moody. All rights reserved.
//

import UIKit

class WILImageTableViewCell: UITableViewCell {
    
    var dogToSearch: String? {
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var imageOne: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    
    func updateView() {
        guard let dogToSearch = dogToSearch else {return}
        
        WILDogController.shared().fetchImageUrl(with: (dogToSearch), type: "") { (url) in
            WILDogController.shared().fetchImage(with: url, completion: { (image) in
                DispatchQueue.main.async {
                    self.imageOne.image = image
                }
            })
        }
        WILDogController.shared().fetchImageUrl(with: dogToSearch, type: "") { (url) in
            WILDogController.shared().fetchImage(with: url, completion: { (image) in
                DispatchQueue.main.async {
                    self.imageTwo.image = image
                }
            })
        }
    }
    
}
