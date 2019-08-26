//
//  ViewController.swift
//  DataPass2
//
//  Created by AnhDCT on 8/16/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    var ramdomNumber = 0.0
    var time = Timer()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        timer.text = String(ramdomNumber)
        time = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }

    @IBAction func next(_ sender: UIButton) {
        let detail = storyboard?.instantiateViewController(withIdentifier: "detail") as? detailViewController
        
        present(detail!, animated: true, completion: nil)
    }
    @objc func updateTime(){
        ramdomNumber += drand48()
        progress.progress = Float(ramdomNumber/10)
        timer.text = String(format: "%.1f", progress.progress*100) + "%"
        if progress.progress == Float(1) {
            time.invalidate()
            timer.text = "Done"
        }
        Singleton.sharedInstance.userInfo = timer.text ?? "Done"
        NotificationCenter.default.post(name: Notification.Name(rawValue: ""), object: self)
    }
    
}

