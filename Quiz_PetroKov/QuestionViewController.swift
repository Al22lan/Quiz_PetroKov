//
//  QuiestionViewController.swift
//  Quiz_PetroKov
//
//  Created by Admin on 09.04.16.
//  Copyright © 2016 PetroKov_LSR_A. All rights reserved.
//

import UIKit

class QuiestionViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var questionList: [Question]? {
        didSet {
        currentQuestion = questionList?.first
        }
    }
    var currentQuestion:Question?{
        didSet{
        updateViews()
        }
    }
    
    var answers:[String]?{
    return currentQuestion?.answers
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
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
        questionList = questionModels
    }
    
    func updateViews(){
    let image = currentQuestion?.image
        //Картинка
        ImageView.image = image
        //Вопрос
        Label.text = currentQuestion?.question
        //Перезаполнение таблевью
        tableView.reloadData()
        
    }
    
}

extension QuiestionViewController:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers?.count ?? 0
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        cell.textLabel?.text = answers?[indexPath.row]
        //нижний текст
        let isCorrect = currentQuestion?.isCorrectAnswer(answers?[indexPath.row]) ?? false
        cell.detailTextLabel?.text = isCorrect ? "Это гуд" : "Не гуд"
        return cell
    }
}



















