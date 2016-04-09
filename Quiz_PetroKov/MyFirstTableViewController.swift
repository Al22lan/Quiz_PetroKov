//
//  MyFirstTableViewController.swift
//  Quiz_PetroKov
//
//  Created by Admin on 09.04.16.
//  Copyright © 2016 PetroKov_LSR_A. All rights reserved.
//

import UIKit

class MyFirstTableViewController: UIViewController {

    @IBOutlet weak var TContr: UITableView!
    var model2:[[String]] = [["111","1234","5443"],["asd","frw"]]
    var model:[String] = {
        var aLotOfString = "lghk b d gbi df dfds fd dfv dfv dfv dfv dfv dfv dfvre grtg  lk ;kpwodf;;d os dsfvj kjvh hfdshdfkh kdhvfd vdjkf hkdhv gjisjj  fd  fd fgd dfgdf".componentsSeparatedByString(" ")
      //  print ( \(aLotofString.count))
        return aLotOfString
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TContr.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyFirstTableViewController:UITableViewDataSource{

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print ("tableView cells count")
        //return model.count
        return model2[section].count
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "StringCell"
    //  Запрос ячейки у табле вью
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId)
        
        let stringIndex = indexPath.row
        let section = indexPath.section
        
        cell?.textLabel?.text = model2[section][stringIndex]
        print ("Numbers of Cells \(indexPath)")
        return cell!
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return model2.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }














}