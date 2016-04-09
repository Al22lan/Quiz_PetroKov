//
//  QuiestionViewController.swift
//  Quiz_PetroKov
//
//  Created by Admin on 09.04.16.
//  Copyright © 2016 PetroKov_LSR_A. All rights reserved.
//

import UIKit

class QuiestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }

    func loadData(){
        let fileName = "cinema"
        let fileExt = "json"
        //Запрос у Bandle (хранилище файлов поставляемое с приложением)
        let pathToVictorinFile = NSBundle.mainBundle().pathForResource(fileName, ofType: fileExt)!
        let data = NSData(contentsOfFile: pathToVictorinFile)!
        print (data)
        //! означает что я гарантирую что там имеено данные JSON
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        //print ("Содержимое викторины \(json)")
        
        //Пробуем представить json  как коллекцию вида Строка - любой объект
        guard let questionJSON = json as? [String:AnyObject],
            //если повевезет, то считаем из questionJSON сщдержимое
            let questionsToParse = questionJSON["questions"] as? [[String:AnyObject]] else {
                print ("Faild to load DataModel")
                return
                   }
        let questionModels = questionsToParse.map{json->Question in
            let parsedModel = Question(json:json)
            return parsedModel
                }
        print ("Ваще ничего не понятно! \n\(questionModels)")
    }
}
