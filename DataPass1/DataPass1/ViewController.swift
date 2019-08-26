//
//  ViewController.swift
//  DataPass1
//
//  Created by AnhDCT on 8/25/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PassData {
    
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setLabel), name: NSNotification.Name("A"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func setLabel(notification : NSNotification){
        label.text = notification.userInfo?["text"] as? String
    }
    
    @IBAction func switchDetail(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.delegate = self
        vc.clos = {[weak self] text in
        self?.label.text = text
        }
        present(vc, animated: true, completion: nil)
    }
    
    func passing(text: String) {
        label.text = text
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    

}

