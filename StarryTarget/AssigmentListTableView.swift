//
//  File.swift
//  StarryTarget
//
//  Created by Xueliang Chen on 1/18/18.
//  Copyright © 2018 Conceptual. All rights reserved.
//

import Foundation
import UIKit

class AssigmentListTableView:UITableView,UITableViewDelegate,UITableViewDataSource
{
    //private weak var ExternalSegueBehavior:SegueBehavior?
    
    //Reference of the AddBtnTableViewCell
    public var AddBtnTableViewCell:AddBtnTableViewCell?
    
    override func layoutSubviews() {
        
        //Clear tableview's separatorStyle
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
        
        //The section of Index = 0 contains the AddBtnTableViewCell
        if(indexPath.section == 0)
        {
            let specificCell = self.dequeueReusableCell(withIdentifier: "AddBtnTableViewCell") as! AddBtnTableViewCell
            
            AddBtnTableViewCell = specificCell
            cell = specificCell
        }
        else
        {
            let specificCell = self.dequeueReusableCell(withIdentifier: "SingleAssignmentTableViewCell") as! SingleAssignmentTableViewCell
            
            specificCell.TitleLabel.text = "There is title"
            specificCell.TimeLabel.text = "There is time"
            
            cell = specificCell
        }
       
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //To make the spacing between each cells, put every single cell into a independent section
        return 1;
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //To simulate the spacing, section's header is a transparent UIView
        let tempView = UIView()
        tempView.backgroundColor = UIColor.clear
        return tempView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 12
    }
}
