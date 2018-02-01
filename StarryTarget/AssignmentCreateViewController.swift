//
//  AssignmentCreateViewController.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/21/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AssignmentCreateViewController: UIViewController {
    
    @IBOutlet weak var MainTimePickerView: TimePickerView!
    
    
    @IBOutlet weak var StartPeriodLabel: UILabel!
    @IBOutlet weak var StartTimeLabel: UILabel!
    
    @IBOutlet weak var EndPeriodLabel: UILabel!
    @IBOutlet weak var EndTimeLabel: UILabel!
    
    private var timer:Timer?
    
    private var StartTime:Variable<Date> = Variable<Date>(Date())
    private var EndTime:Variable<Date> = Variable<Date>(Date())
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //gesture - tap EndTimeLabel to show TimePickerView
        let tapBehavior = UITapGestureRecognizer(target: self, action:#selector(self.showDatePicker))
        EndTimeLabel.isUserInteractionEnabled = true
        EndTimeLabel.addGestureRecognizer(tapBehavior)
        
        //observer UILabs
        StartTime.asObservable().map({t -> String in
            let dateFormatterForPeriod = DateFormatter()
            dateFormatterForPeriod.dateFormat = "a"
            
            return dateFormatterForPeriod.string(from: t)
        }).bind(to:StartPeriodLabel.rx.text).disposed(by: self.disposeBag)
        
        StartTime.asObservable().map({t -> String in
            let dateFormatterForTime = DateFormatter()
            dateFormatterForTime.dateFormat = "HH:mm"
            
            return dateFormatterForTime.string(from: t)
        }).bind(to:StartTimeLabel.rx.text).disposed(by: self.disposeBag)
        
        MainTimePickerView.time.asObservable().map({t -> Date in
            let targetTime = Date().addingTimeInterval(TimeInterval(t.hour!*60*60 + t.minute!*60 + t.second!))
            
            return targetTime
        }).bind(to: EndTime).disposed(by: self.disposeBag)
        
        EndTime.asObservable().map({t -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a"
            
            return dateFormatter.string(from: self.EndTime.value)
        }).bind(to: EndPeriodLabel.rx.text).disposed(by: self.disposeBag)
        
        EndTime.asObservable().map({t -> String in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            
            return dateFormatter.string(from: self.EndTime.value)
        }).bind(to: EndTimeLabel.rx.text).disposed(by: self.disposeBag)
        
        //set timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCurrentTime), userInfo: nil, repeats: true)
    }
    
    @objc func showDatePicker(sender:UITapGestureRecognizer)
    {
        MainTimePickerView.isHidden = false
    }
    
    @objc func updateCurrentTime()
    {
        StartTime.value = Date()
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
