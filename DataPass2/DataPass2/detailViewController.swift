//
//  detailViewController.swift
//  DataPass2
//
//  Created by AnhDCT on 8/18/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    var time2: Float = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl.text = "Done"
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doSomethingAfterNotified),
                                               name: NSNotification.Name(rawValue: "" ),
                                               object: nil)
       

        // Do any additional setup after loading the view.
    }

        
    @objc func doSomethingAfterNotified() {
        lbl.text = Singleton.sharedInstance.userInfo
    }
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
