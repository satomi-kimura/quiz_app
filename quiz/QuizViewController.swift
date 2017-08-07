//
//  QuizViewController.swift
//  quiz
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var next_button: UIButton!
    @IBOutlet weak var text: UITextView!
    @IBOutlet weak var QAres: UILabel!

    var colors = [ ["name": "バーミリオン","red":1.0,"Green":0.2,"Blue":0.25], ["name": "スカーレット","red":1.0,"Green":0.2,"Blue":0.2]
        ,["name": "紅","red":1.0,"Green":0.0,"Blue":0.22], ["name": "薄紅","red":0.96,"Green":0.596,"Blue":0.5882]
        ,["name": "鳶色","red":0.5,"Green":0.18,"Blue":0.25], ["name": "栗色","red":0.35,"Green":0.11,"Blue":0.07]
        ,["name": "茶色","red":0.35,"Green":0.2,"Blue":0.15],["name": "褐色","red":0.45,"Green":0.14,"Blue":0.0]
        ,["name": "琥珀色","red":0.70,"Green":0.35,"Blue":0.2], ["name": "黄土色","red":0.7,"Green":0.459,"Blue":0.21]
        ,["name": "マンダリンオレンジ","red":1.0,"Green":0.5,"Blue":0.1], ["name": "山吹色","red":1.0,"Green":0.65,"Blue":0.0]
        ,["name": "杏色","red":1.0,"Green":0.65,"Blue":0.45],["name": "カナリーイエロー","red":1.0,"Green":1.0,"Blue":0.3]
        ,["name": "向日葵色","red":1.0,"Green":0.75,"Blue":0.0], ["name": "抹茶色","red":0.678,"Green":0.75,"Blue":0.3]
        ,["name": "オリーブ","red":0.3,"Green":0.27,"Blue":0.059], ["name": "常磐色","red":0.122,"Green":0.5,"Blue":0.05]
        ,["name": "ビリジアン","red":0.14,"Green":0.7,"Blue":0.212],["name": "リーフグリーン","red":0.54,"Green":0.9,"Blue":0.18]
        ,["name": "エメラルドグリーン","red":0.2,"Green":1.0,"Blue":0.25], ["name": "若葉色","red":0.65,"Green":0.902,"Blue":0.44]
        ,["name": "甕覗き","red":0.6,"Green":1.0,"Blue":0.85], ["name": "ターコイズブルー","red":0.2,"Green":1.0,"Blue":0.8]
        ,["name": "ピーコックグリーン","red":0.1,"Green":1.0,"Blue":0.5],["name": "セルリアンブルー","red":0.14,"Green":0.7,"Blue":0.67]
        ,["name": "マリンブルー","red":0.0,"Green":0.5,"Blue":0.43], ["name": "藍色","red":0.141,"Green":0.36,"Blue":0.45]
        ,["name": "シアン","red":0.0,"Green":1.0,"Blue":1.0], ["name": "ラベンダー","red":0.769,"Green":0.7,"Blue":1.0]
        ,["name": "杜若色","red":0.2,"Green":0.4,"Blue":1.0],["name": "群青色","red":0.25,"Green":0.45,"Blue":1.0]
        ,["name": "バイオレット","red":0.25,"Green":0.2,"Blue":1.0], ["name": "瑠璃紺","red":0.078,"Green":0.24,"Blue":0.8]
        ,["name": "菖蒲（しょうぶ）色","red":0.3,"Green":0.18,"Blue":1.0], ["name": "牡丹色","red":0.98,"Green":0.25,"Blue":1.0]
        ,["name": "菖蒲（あやめ）色","red":0.8,"Green":0.4,"Blue":1.0],["name": "ローズピンク","red":1.0,"Green":0.5,"Blue":0.8]
        ,["name": "薔薇色","red":1.0,"Green":0.2,"Blue":0.6], ["name": "赤紫","red":1.0,"Green":0.3,"Blue":1.0]
        ,["name": "マゼンタ","red":1.0,"Green":0.0,"Blue":1.0],["name": "ワインレッド","red":0.67,"Green":0.141,"Blue":0.47]
        ,["name": "バーガンディー","red":0.3,"Green":0.09,"Blue":0.3], ["name": "スノーホワイト","red":0.96,"Green":1.0,"Blue":1.0]
        ,["name": "セピア","red":0.25,"Green":0.18,"Blue":0.19], ["name": "勝色","red":0.2,"Green":0.21,"Blue":0.3]
    ,["name": "江戸紫","red":0.361,"Green":0.271,"Blue":0.902], ["name": "コバルトブルー","red":0.0,"Green":0.502,"Blue":1.0]
    ,["name": "ミントグリーン","red":0.502,"Green":1.0,"Blue":0.502], ["name": "浅葱","red":0.180,"Green":0.89,"Blue":0.63]]
    var time = 0;
    
    override func viewDidLoad() {
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        
        let ud = UserDefaults.standard
        ud.set(0, forKey: "number_Q")
        ud.set(0, forKey: "number_A")
        ud.synchronize()
        
        super.viewDidLoad()
        makeQuestions()
        StartQuestions()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeQuestions(){
        let num_col: Int = colors.count
        for i in 0..<num_col {
            let idx = Int(arc4random_uniform(UInt32(num_col-1)))
            let arr = colors[idx]
            colors[idx]=colors[i]
            colors[i] = arr
        }
        button1.layer.cornerRadius = 10.0
        button2.layer.cornerRadius = 10.0
        button3.layer.cornerRadius = 10.0
        button4.layer.cornerRadius = 10.0
    }
    
    func StartQuestions(){
        text.text="What is this colors name?"
        next_button.isHidden=true
        
        //decide answer
         var answer = Int(arc4random_uniform(4))
        let ud = UserDefaults.standard
        ud.set(answer, forKey: "answer")
        ud.synchronize()
        answer = answer+time
        //set button title
        button1.setTitle( colors[0+time]["name"] as? String, for: .normal)
        button2.setTitle( colors[1+time]["name"] as? String, for: .normal)
        button3.setTitle( colors[2+time]["name"] as? String, for: .normal)
        button4.setTitle( colors[3+time]["name"] as? String, for: .normal)
        //set butto n text color
        let r = colors[answer]["red"]  as! Double
        let g = colors[answer]["Green"]  as! Double
       let b = colors[answer]["Blue"]  as! Double
        self.view.backgroundColor = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1.0)
        let num = r + g + b
        if(num>1.5){
            button1.setTitleColor(UIColor.black, for: .normal)
            button2.setTitleColor(UIColor.black, for: .normal)
            button3.setTitleColor(UIColor.black, for: .normal)
            button4.setTitleColor(UIColor.black, for: .normal)
            next_button.setTitleColor(UIColor.black, for: .normal)
            text.textColor = UIColor.black
            QAres.textColor=UIColor.black
        }else{
            button1.setTitleColor(UIColor.white, for: .normal)
            button2.setTitleColor(UIColor.white,for: .normal)
            button3.setTitleColor(UIColor.white, for: .normal)
            button4.setTitleColor(UIColor.white, for: .normal)
            next_button.setTitleColor(UIColor.white, for: .normal)
            text.textColor = UIColor.white
            QAres.textColor=UIColor.white
        }
        button1.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        button2.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        button3.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        button4.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }

    @IBAction func AAction(_ sender: AnyObject) {
        let ud = UserDefaults.standard
        let a = ud.integer(forKey: "answer")
        if a == 0{
            correct()
        }else{
            text.text="Miss!!"
        }
        colorbuttom()
    }
    @IBAction func BAction(_ sender: AnyObject){
        let ud = UserDefaults.standard
        let a = ud.integer(forKey: "answer")
        if a == 1{
            correct()
        }else{
            text.text="Miss!!"
        }
        colorbuttom()
    }
    @IBAction func CAction(_ sender: AnyObject) {
        let ud = UserDefaults.standard
        let a = ud.integer(forKey: "answer")
        if a == 2{
            correct()
        }else{
            text.text="Miss!!"
        }
        colorbuttom()
    }
    @IBAction func DAction(_ sender: AnyObject){
        let ud = UserDefaults.standard
        let a = ud.integer(forKey: "answer")
        if a == 3{
            correct()
        }else{
            text.text="Miss!!"
        }
        colorbuttom()
    }
    
    @IBAction func Next(){
        //set button
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        button4.isEnabled = true
        
        time = time+4
        if(time+4>colors.count){
            makeQuestions()
            time = 0
        }
        StartQuestions()
    }
    
    // here is function///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    func correct(){
        text.text="Correct!!"

        //set UD
        let ud = UserDefaults.standard
        var TA = ud.integer(forKey:"number_A")
        TA = TA+1
        ud.set(TA, forKey: "number_A")
        ud.synchronize()
    }
    
    func colorbuttom(){
        //set button color
        var j = [0.0,0.0,0.0,0.0]
        for i in 0..<4{
         j[i] = (colors[time+i]["red"]  as! Double)+(colors[time+i]["Green"]  as! Double)+(colors[time+i]["Blue"]  as! Double)
        j[i]=j[i]/3
        }
        //change background color
        button1.backgroundColor = UIColor(red: CGFloat(colors[time]["red"]  as! Double), green: CGFloat(colors[time]["Green"]  as! Double), blue: CGFloat(colors[time]["Blue"]  as! Double), alpha: 1.0)
        button2.backgroundColor = UIColor(red: CGFloat(colors[time+1]["red"]  as! Double), green: CGFloat(colors[time+1]["Green"]  as! Double), blue: CGFloat(colors[time+1]["Blue"]  as! Double), alpha: 1.0)
        button3.backgroundColor = UIColor(red: CGFloat(colors[time+2]["red"]  as! Double), green: CGFloat(colors[time+2]["Green"]  as! Double), blue: CGFloat(colors[time+2]["Blue"]  as! Double), alpha: 1.0)
        button4.backgroundColor = UIColor(red: CGFloat(colors[time+3]["red"]  as! Double), green: CGFloat(colors[time+3]["Green"]  as! Double), blue: CGFloat(colors[time+3]["Blue"]  as! Double), alpha: 1.0)
        //change button text  color
        if j[0] > 0.5       { button1.setTitleColor(UIColor.black, for: .normal)}
        else {button1.setTitleColor(UIColor.white, for: .normal)}
        if j[1] > 0.5       { button2.setTitleColor(UIColor.black, for: .normal)}
        else {button2.setTitleColor(UIColor.white, for: .normal)}
        if j[2] > 0.5       { button3.setTitleColor(UIColor.black, for: .normal)}
        else {button3.setTitleColor(UIColor.white, for: .normal)}
        if j[3] > 0.5       { button4.setTitleColor(UIColor.black, for: .normal)}
        else {button4.setTitleColor(UIColor.white, for: .normal)}
        
        //enable button
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
        button4.isEnabled = false
        next_button.isHidden = false
        
        //set A/Q
        let ud = UserDefaults.standard
        var TA = ud.integer(forKey:"number_Q")
        TA = TA+1
        ud.set(TA, forKey:"number_Q")
        ud.synchronize()
        let TAA = String(ud.integer(forKey:"number_A"))
        let TQQ = String(TA)
        var res = "/"
        res = TAA+res+TQQ
        QAres.text = res
    }
}
