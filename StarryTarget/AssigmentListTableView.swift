//
//  File.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/18/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import UIKit

protocol SegueBehavior:NSObjectProtocol{
    func SegueToAnotherScreen()->Void;
}

class AssigmentListTableView:UITableView,UITableViewDelegate,UITableViewDataSource
{
    private weak var ExternalSegueBehavior:SegueBehavior?;
    
    override func layoutSubviews() {
        
        //clear tableview's separatorStyle
        self.separatorStyle = .none
        
        self.register(UINib(nibName : "SingleAssignmentTableViewCell", bundle : nil), forCellReuseIdentifier: "SingleAssignmentTableViewCell");
        
        self.delegate = self;
        self.dataSource = self;
        
        super.layoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = self.dequeueReusableCell(withIdentifier: "SingleAssignmentTableViewCell") as! SingleAssignmentTableViewCell
        return cell.frame.size.height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "SingleAssignmentTableViewCell") as! SingleAssignmentTableViewCell
        cell.Title.text = "There is title"
        cell.Time.text = "There is time"
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tempView = UIView()
        tempView.backgroundColor = UIColor.clear
        return tempView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
}
