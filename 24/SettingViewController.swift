//
//  SettingViewController.swift
//  24
//
//  Created by XingjianDing on 11/5/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var timerField: UITextField!
    var playVC: PlayViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func enterTime(_ sender: Any) {
        let newtime: Int? = Int(timerField.text!)
        playVC!.setNewTime(newtime: newtime!)
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
