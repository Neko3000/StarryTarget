//
//  TimePickerView.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/25/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit

class TimePickerView: UIView,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var PickerView:UIPickerView!
    
    var hour:Int = 0
    var minute:Int = 0
    var second:Int = 0
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        
        PickerView.delegate = self
        PickerView.dataSource = self
    }
    
    @IBAction func CancelBtnTapped(_ sender:Any){
        self.isHidden = true
    }
    
    @IBAction func DoneBtnTapped(_ sender:Any)
    {
        UIView.transition(with: self, duration: 2, options: .transitionFlipFromTop, animations: {
            self.isHidden = true;
            }, completion: nil)
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 24
        case 1,2:
            return 60
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width/3
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return (row == 0 ? "Hour" : "\(row)")
        case 1:
            return (row == 0 ? "Minute":"\(row)")
        case 2:
            return (row == 0 ? "Second":"\(row)")
        default:
            return ""
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            hour = row
        case 1:
            minute = row
        case 2:
            second = row
        default:
            break
        }
    }
}
