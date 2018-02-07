//
//  ViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/15/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,SegueBehaviorObject{
    
    @IBOutlet weak var MainTableView: AssignmentListTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        MainTableView.AddBtnTableViewCell?.ViewControllerWithSegueBehavior = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Segue function handled by func AddBtnTouchUpInside in AddBtnTableCell of MainTableView
    func SegueToAnotherScreen() {
        performSegue(withIdentifier: "ShowAssignmentCreateView", sender: nil)
    }
}

