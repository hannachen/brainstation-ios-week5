//
//  DetailsViewController.swift
//  Week5 Homework
//
//  Created by Hanna Chen on 2/6/17.
//  Copyright © 2017 Rethink Canada. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    // Outlets
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var detailsTextView: UITextView!
    
    // Properties
    var profile: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.detailsTextView.alpha = 1
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.detailsTextView.alpha = 0
        
        if let profile = self.profile {
            let fullName: String = profile.firstName + " " + profile.lastName
            self.title = profile.firstName
            self.nameLabel.text = fullName
            self.detailsTextView.text = profile.details
            if let photo = profile.photo {
                photoImageView.image = photo
            }
        } else {
            print("Nothing was passed.")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
