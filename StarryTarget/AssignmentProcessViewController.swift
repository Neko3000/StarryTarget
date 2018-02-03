//
//  AssignmentProcessViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/21/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

class AssignmentProcessViewController: UIViewController {
    
    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    
    //Components
    @IBOutlet weak var AnimationImageView: UIImageView!
    
    public var timeSecond:Int?{
        set(value){
            _timeSecond = value
        }
        get{
            return _timeSecond
        }
    }
    
    private var _timeSecond:Int? = 0
    
    private var timeSecondCounter:Int? = 0
    
    private var timer:Timer?
    
    //thread
    private var loadAnimationThread:Thread?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        //set timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        

        //set thread
        loadAnimationThread = Thread(target: self, selector: #selector(loadAnimation), object: nil)
        loadAnimationThread?.start()
    }

    @objc func updateTime(){
        let hour:Int = _timeSecond! / 3600
        let minute:Int = (_timeSecond! % 3600)/60
        let second:Int = _timeSecond! % 60
        
        HourLabel.text = "\(hour)"
        MinuteLabel.text = "\(minute)"
        SecondLabel.text = "\(second)"
        
        timeSecond = timeSecond! - 1
        
        if(_timeSecond! <= 0)
        {
            timer?.invalidate()
            segueToAnotherScreen()
        }
        
    }
    
    func segueToAnotherScreen(){
        performSegue(withIdentifier: "ShowAssignmentAchieveView", sender: nil)
    }
    
    //func for AnimationImageView
    //note: one of the alternatives is to use Thread to preload animation, then use instantiateViewController and present to show this view without segue in the previous viewController, it may need to use loadViewIfNeeded here.
    
    @objc func loadAnimation()
    {
        let animation = UIImage.animatedImageNamed("person-working/person-working_", duration: 3)
        if(animation != nil)
        {
            performSelector(onMainThread: #selector(setAnimation(animation:)), with: animation, waitUntilDone: true)
        }

    }

    @objc func setAnimation(animation:UIImage)
    {
        AnimationImageView.image = animation
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
