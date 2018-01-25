//
//  AssignmentCreateViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/21/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

class AssignmentCreateViewController: UIViewController {

    
    @IBOutlet weak var EndTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapBehavior = UITapGestureRecognizer(target: self, action:#selector(self.showDatePicker))
        EndTimeLabel.isUserInteractionEnabled = true
        EndTimeLabel.addGestureRecognizer(tapBehavior)
    }
    
    @objc func showDatePicker(sender:UITapGestureRecognizer)
    {
        print("do it")
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
