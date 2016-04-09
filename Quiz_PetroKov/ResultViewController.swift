//
//  ResultViewController.swift
//  Quiz_PetroKov
//
//  Created by Admin on 09.04.16.
//  Copyright © 2016 PetroKov_LSR_A. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    var result = 0 {//from 0 to 100
        didSet {
            switch result{
            case Int.min ..< 0:
                result = 0
            case 101 ..< Int.max:
                result = 100
            default:
                return
            }
        }
    
    }
    @IBOutlet weak var resultLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func updateViews() {
        var text = ""
        switch result {
        case 0:
            text = "Ты БОТ, Я так не играю"
        case 1 ... 30:
            text = "Ты  в общем то дебил"
        case 31 ... 55:
            text = "В принципе норм"
        case 56 ... 99:
            text = "Ты Крут"
        case 100:
            text = "Ты точно БОТ!!"
        default: print ("Не уточнено значние рейтинга \(text)")
            text = "Ошибочка с рейтингом у нас "
        }
    resultLable.text = text
    }
    

}
