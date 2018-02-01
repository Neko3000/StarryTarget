//
//  TimePickerView.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/25/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct Time {
    init() {
        hour = 0
        minute = 0
        second = 0
    }
    init(h:Int,m:Int,s:Int)
    {
        hour = h
        minute = m
        second = s
    }
    public var hour:Int?
    public var minute:Int?
    public var second:Int?
}

class TimePickerView: UIView,UIPickerViewDelegate,UIPickerViewDataSource{

    @IBOutlet weak var PickerView:UIPickerView!
    
    public var time:Variable<Time> = Variable<Time>(Time())
    private var perviousTime:Time?
    
    //unused properties
    private var _hour:Int = 0
    private var _minute:Int = 0
    private var _second:Int = 0
    
    public var hour:Int{
        get{
            return _hour
        }
    }
    public var minute:Int{
        get{
            return _minute
        }
    }
    public var second:Int{
        get{
            return _second
        }
    }
    
    
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
        time.value.hour = PickerView.selectedRow(inComponent: 0)
        time.value.minute = PickerView.selectedRow(inComponent: 1)
        time.value.second = PickerView.selectedRow(inComponent: 2)
        
        self.isHidden = true
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
            time.value.hour = row
        case 1:
            time.value.minute = row
        case 2:
            time.value.second = row
        default:
            break
        }
    }
}
