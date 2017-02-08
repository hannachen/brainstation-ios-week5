//
//  Person.swift
//  Week5 Homework
//
//  Created by Hanna Chen on 2/6/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import Foundation
import UIKit

class Person {

    var firstName: String
    var lastName: String
    var details: String?
    var photo: UIImage?
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func setDetails(details: String) {
        self.details = details
    }
    
    func setPhoto(photoName: String) {
        let profileImage = UIImage(named: photoName)
        if let photo = profileImage {
            self.photo = photo
        }
    }
    
    func setupThumbnail(container: UIImageView, x: Int = 50, y: Int = 50, size: Int = 500) {
        
        if let profilePhoto = self.photo {
            
            let contextImage: UIImage = UIImage(cgImage: profilePhoto.cgImage!)
            
            // Calculate position as percentage
            let contextSize: CGSize = contextImage.size
            let cgX: CGFloat = CGFloat(x)
            let cgY: CGFloat = CGFloat(y)
            let posX: CGFloat = (contextSize.width/100)*cgX
            let posY: CGFloat = (contextSize.height/100)*cgY
            
            // Set crop square size
            let cgwidth: CGFloat = CGFloat(size)
            let cgheight: CGFloat = CGFloat(size)
            
            let rect: CGRect = CGRect(x: posX-cgwidth/2, y: posY-cgheight/2, width: cgwidth, height: cgheight)
            let imageRef: CGImage = contextImage.cgImage!.cropping(to: rect)!
            
            print("scale: \(profilePhoto.scale)")
            
            let profileImage: UIImage = UIImage(cgImage: imageRef, scale: profilePhoto.scale, orientation: profilePhoto.imageOrientation)
            container.image = profileImage
        }
        
        // Apply circular mask to container
        container.layer.borderWidth = 0
        container.layer.masksToBounds = false
        container.layer.borderColor = UIColor.white.cgColor
        container.layer.cornerRadius = container.frame.height/2
        container.clipsToBounds = true
        container.contentMode = .scaleAspectFit
    }
}
