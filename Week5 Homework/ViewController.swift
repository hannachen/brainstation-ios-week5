//
//  ViewController.swift
//  Week5 Homework
//
//  Created by Hanna Chen on 2/6/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Animation settings
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3
    
    // Outlets
    @IBOutlet var hannaThumbnailImageView: UIImageView!
    @IBOutlet var shaunThumbnailImageView: UIImageView!
    
    // Properties
    var profiles: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "BestBuds"
        
        // Add Hanna's details
        let hannaProfile: Person = Person(firstName: "Hanna", lastName: "Chen")
        hannaProfile.setDetails(details: "Some of Hanna's favourite things are: noodles, drawing, tinkering.")
        hannaProfile.setPhoto(photoName: "HannaPhoto")
        hannaProfile.setupThumbnail(container: self.hannaThumbnailImageView, x: 53, y: 12, size: 250)
        profiles.append(hannaProfile)
        
        // Add Shaun's details
        let shaunProfile: Person = Person(firstName: "Shaun", lastName: "Ma")
        shaunProfile.setDetails(details: "Shaun loves cycling, craft beer, and playing Overwatch.")
        shaunProfile.setPhoto(photoName: "ShaunPhoto")
        shaunProfile.setupThumbnail(container: self.shaunThumbnailImageView, x: 31, y: 17, size: 460)
        profiles.append(shaunProfile)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailsViewController = segue.destination as? DetailsViewController {
            /*
             Q: how do I connect a button to the data? Do I need to create the buttons with code instead of the storyboard?
            */
            if let button = sender as? UIButton {
                detailsViewController.profile = self.profiles[button.tag]
            }
        }
    }
}

