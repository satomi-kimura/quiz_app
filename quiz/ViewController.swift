//
//  ViewController.swift
//  quiz
//
//  Created by nttr on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func goNext(_ sender:UIButton) {
        let next = storyboard!.instantiateViewController(withIdentifier: "startquiz")
        self.present(next,animated: true, completion: nil)
    }
    
    // セグエ遷移用に追加 ↓↓↓
    @IBAction func goNextBySegue(_ sender:UIButton) {
        performSegue(withIdentifier: "startquiz", sender: nil)
    }

}

