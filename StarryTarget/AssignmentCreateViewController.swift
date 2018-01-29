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
    
    @IBOutlet weak var EndPeriodLabel: UILabel!
    @IBOutlet weak var EndTimeLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let tapBehavior = UITapGestureRecognizer(target: self, action:#selector(self.showDatePicker))
        EndTimeLabel.isUserInteractionEnabled = true
        EndTimeLabel.addGestureRecognizer(tapBehavior)
        
        //observer UILabs
        MainTimePickerView.time.asObservable().map({t -> String? in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            
            let targetTime = Date().addingTimeInterval(TimeInterval(t.hour!*60*60 + t.minute!*60 + t.second!))
            let targetTimeString = dateFormatter.string(from: targetTime)
            
            return targetTimeString
        }).bind(to: EndTimeLabel.rx.text).disposed(by: self.disposeBag)
        
        MainTimePickerView.time.asObservable().map({t -> String? in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "a"
            
            let targetTime = Date().addingTimeInterval(TimeInterval(t.hour!*60*60 + t.minute!*60 + t.second!))
            
            return dateFormatter.string(from: targetTime)
        }).bind(to: EndPeriodLabel.rx.text).disposed(by: self.disposeBag)
        
    }
    
    @objc func showDatePicker(sender:UITapGestureRecognizer)
    {
        MainTimePickerView.isHidden = false
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
