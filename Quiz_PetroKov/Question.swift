//
//  Quiestion.swift
//  Quiz_PetroKov
//
//  Created by Admin on 09.04.16.
//  Copyright © 2016 PetroKov_LSR_A. All rights reserved.
//

import UIKit

struct Question {
    
    
    let question : String
    let answers: [String]
    let correctAnswer: String
    let imageName: String
    var image:UIImage?{
        return UIImage(named: imageName)
    }
    
    init(json:[String:AnyObject]){
    question = json["question"] as! String
    answers = json["answers"] as! [String]
    correctAnswer = json["correctAnswer"] as! String
    imageName = json["image"] as! String
    }
    func isCorrectAnswer(answer:String?)->Bool{
        guard answer != nil else{ return false}
    return correctAnswer == answer
    }
    
}
