//
//  DetailViewController.swift
//  DataPass1
//
//  Created by AnhDCT on 8/25/19.
//  Copyright © 2019 AnhDCT. All rights reserved.
//

import UIKit
protocol PassData: class {
    func passing(text: String)
}
class DetailViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    weak var delegate : PassData?
    var clos : ((_ text:String) -> Void)?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func delagate(_ sender: UIButton) {
        delegate?.passing(text: textField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func closure(_ sender: UIButton) {
        clos?(textField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    @IBAction func notification(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("A"), object: self, userInfo: ["text": textField.text ?? ""])
        dismiss(animated: true, completion: nil)
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
