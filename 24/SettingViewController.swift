//
//  SettingViewController.swift
//  24
//
//  Created by XingjianDing on 11/5/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet var timerField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func enterTime(_ sender: Any) {
        let vc = ViewController()
        let timer: Int? = Int(timerField.text!)
        //vc.vc1.time = timer!
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
