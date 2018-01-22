//
//  AssignmentAchieveViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/22/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

class AssignmentAchieveViewController: UIViewController {

    //Components
    
    @IBOutlet weak var AnimationImageView: UIImageView!
    
    @IBOutlet weak var QuoteContentLabel: UILabel!
    @IBOutlet weak var QuoteAuthorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Load animation images into AnimationImageView
        AnimationImageView.image = UIImage.animatedImageNamed("moon-cloud/moon-cloud_", duration: 5)
        AnimationImageView.contentMode = .scaleAspectFill
        AnimationImageView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
