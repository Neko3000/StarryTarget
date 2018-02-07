//
//  File.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/18/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class AssignmentListTableView:UITableView,UITableViewDelegate,UITableViewDataSource
{
    //private weak var ExternalSegueBehavior:SegueBehavior?
    
    //reference of the AddBtnTableViewCell
    public var AddBtnTableViewCell:AddBtnTableViewCell?
    
    //main-data
    private lazy var assignmentRecords:Results<AssignmentRecord> = {
        var realm = try! Realm()
        return realm.objects(AssignmentRecord.self)
    }()
    
    override func layoutSubviews() {
        
        //clear tableview's separatorStyle
        self.separatorStyle = .none
        
        self.register(UINib(nibName : "SingleAssignmentTableViewCell", bundle : nil), forCellReuseIdentifier: "SingleAssignmentTableViewCell");
        self.register(UINib(nibName : "AddBtnTableViewCell", bundle : nil), forCellReuseIdentifier: "AddBtnTableViewCell");
        
        self.delegate = self;
        self.dataSource = self;
        
        super.layoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell = self.dequeueReusableCell(withIdentifier: "SingleAssignmentTableViewCell") as! SingleAssignmentTableViewCell
        return cell.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell?
        
        //the section of Index = 0 contains the AddBtnTableViewCell
        if(indexPath.section == 0)
        {
            let specificCell = self.dequeueReusableCell(withIdentifier: "AddBtnTableViewCell") as! AddBtnTableViewCell
            
            AddBtnTableViewCell = specificCell
            cell = specificCell
        }
        else
        {
            let specificCell = self.dequeueReusableCell(withIdentifier: "SingleAssignmentTableViewCell") as! SingleAssignmentTableViewCell
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm.a"

            let assignmentRecord = assignmentRecords[indexPath.section - 1]
            
            specificCell.NameLabel.text = assignmentRecord.name
            specificCell.TimeLabel.text = dateFormatter.string(from: assignmentRecord.startTime) + " - " + dateFormatter.string(from: assignmentRecord.startTime.addingTimeInterval(Double(assignmentRecord.timeSecond)))
            specificCell.IsAchievedImageView.image = assignmentRecord.isAchieved ? UIImage(named: "checked"):UIImage(named:"canceled")
            
            cell = specificCell
        }
       
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //to make the spacing between each cells, put every single cell into a independent section
        return 1;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return assignmentRecords.count + 1;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //to simulate the spacing, section's header is a transparent UIView
        let tempView = UIView()
        tempView.backgroundColor = UIColor.clear
        return tempView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
}
