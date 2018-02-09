//
//  AssignmentProcessViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/21/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift

class AssignmentProcessViewController: UIViewController {
    
    @IBOutlet weak var HourLabel: UILabel!
    @IBOutlet weak var MinuteLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    
    @IBOutlet weak var CurrentTimePeriodLabel: UILabel!
    @IBOutlet weak var CurrentTimeLabel: UILabel!
    
    //components
    @IBOutlet weak var AnimationImageView: UIImageView!
    
    //related variables
    private var _startTime:Date? = Date()
    public var startTime:Date?{
        set(value){
            _startTime = value
        }
        get{
            return _startTime
        }
    }
    private var _timeSecond:Int? = 0
    public var timeSecond:Int?{
        set(value){
            _timeSecond = value
        }
        get{
            return _timeSecond
        }
    }
    private var _name:String? = ""
    public var name:String?{
        set(value){
            _name = value
        }
        get{
            return _name
        }
    }
    
    private var _shortDescription:String? = ""
    public var shortDescription:String?{
        set(value){
            _shortDescription = value
        }
        get{
            return _shortDescription
        }
    }

    //timer
    private var timer:Timer?
    private var timeSecondCounter:Int? = 0
    
    //current-time
    private var currentTime:Variable<Date> = Variable<Date>(Date())
    
    //thread
    private var loadAnimationThread:Thread?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //observer UILabs
        currentTime.asObservable().map({t -> String in
            let dateFormatterForPeriod = DateFormatter()
            dateFormatterForPeriod.dateFormat = "a."
            
            return dateFormatterForPeriod.string(from: t)
        }).bind(to:CurrentTimePeriodLabel.rx.text).disposed(by: self.disposeBag)

        currentTime.asObservable().map({t -> String in
            let dateFormatterForTime = DateFormatter()
            dateFormatterForTime.dateFormat = "HH:mm"
            
            return dateFormatterForTime.string(from: t)
        }).bind(to:CurrentTimeLabel.rx.text).disposed(by: self.disposeBag)
        
        //set timer
        timeSecondCounter = timeSecond
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set thread
        loadAnimationThread = Thread(target: self, selector: #selector(loadAnimation), object: nil)
        loadAnimationThread?.start()
    }

    @objc func updateTime(){
        let hour:Int = timeSecondCounter! / 3600
        let minute:Int = (timeSecondCounter! % 3600)/60
        let second:Int = timeSecondCounter! % 60
        
        HourLabel.text = "\(hour)"
        MinuteLabel.text = "\(minute)"
        SecondLabel.text = "\(second)"
        
        timeSecondCounter = timeSecondCounter! - 1
        
        currentTime.value = Date()
        
        if(timeSecondCounter! <= 0)
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
        
        UIView.animate(withDuration: 0.5, animations: {
            self.AnimationImageView.alpha = 1
        })
    }
    
    private func createRecord(withName name:String,withShortDescription shortDescription:String,startAt startTime:Date,withTimeSecond timeSecond:Int,result isAchieved:Bool)
    {
        let realm = try! Realm()
        let realmManager = RealmManager()
        
        try! realm.write {
            realm.add(AssignmentRecord(id:realmManager.getMaxValue(ofType: AssignmentRecord.self, ofProperty: "id")! + 1,name: (name.isEmpty ? "Unnamed" : name), shortDescription: shortDescription, startTime: startTime, timeSecond: timeSecond, isAchieved: isAchieved))
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "ShowAssignmentCreateView": 
            createRecord(withName: _name!, withShortDescription: _shortDescription!, startAt: _startTime!, withTimeSecond: _timeSecond!, result: false)
        case "ShowAssignmentAchieveView":
            createRecord(withName: _name!, withShortDescription: _shortDescription!, startAt: _startTime!, withTimeSecond: _timeSecond!, result: true)
        default:
            break
        }
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
