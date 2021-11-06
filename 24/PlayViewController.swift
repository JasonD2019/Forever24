//
//  PlayViewController.swift
//  24
//
//  Created by 丁行健 on 11/5/21.
// Original cards images are from Playing Cards iOS Assets https://github.com/hayeah/playing-cards-assets.

import UIKit

class PlayViewController: UIViewController {

    @IBOutlet var plus: UIButton!
    @IBOutlet var minus: UIButton!
    @IBOutlet var times: UIButton!
    @IBOutlet var over: UIButton!
    @IBOutlet var textField: UILabel!
    @IBOutlet var l_parenthesis: UIButton!
    @IBOutlet var r_parenthesis: UIButton!
    @IBOutlet var card1: UIImageView!
    @IBOutlet var card2: UIImageView!
    @IBOutlet var card3: UIImageView!
    @IBOutlet var card4: UIImageView!
    var card_1_Name: String = ""
    var card_2_Name: String = ""
    var card_3_Name: String = ""
    var card_4_Name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentCards()
        clickCheck()
        // Do any additional setup after loading the view.
    }
    
    func presentCards(){
        card_1_Name = "2_clubs"
        let card_1_image = UIImage(named: card_1_Name)
        card1.image = card_1_image
        
        card_2_Name = "2_diamonds"
        let card_2_image = UIImage(named: card_2_Name)
        card2.image = card_2_image
        
        card_3_Name = "8_spades"
        let card_3_image = UIImage(named: card_3_Name)
        card3.image = card_3_image
        
        card_4_Name = "3_hearts"
        let card_4_image = UIImage(named: card_4_Name)
        card4.image = card_4_image
    }
    
    func clickCheck(){
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard1(sender:)))
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard2(sender:)))
        let gesture3 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard3(sender:)))
        let gesture4 = UITapGestureRecognizer(target: self, action:  #selector(self.clickCard4(sender:)))
        card1.addGestureRecognizer(gesture1)
        card2.addGestureRecognizer(gesture2)
        card3.addGestureRecognizer(gesture3)
        card4.addGestureRecognizer(gesture4)
    }
    
    @objc func clickCard1(sender : UITapGestureRecognizer) {
        print(card_1_Name)
    }

    @objc func clickCard2(sender : UITapGestureRecognizer) {
        print(card_2_Name)
    }
    
    @objc func clickCard3(sender : UITapGestureRecognizer) {
        print(card_3_Name)
    }
    
    @objc func clickCard4(sender : UITapGestureRecognizer) {
        print(card_4_Name)
    }
    
    @IBAction func clickPlus(_ sender: Any) {
        textField.text = "\(textField.text!) +"
    }
    @IBAction func clickMinus(_ sender: Any) {
        textField.text = "\(textField.text!) -"
    }
    @IBAction func clickTimes(_ sender: Any) {
        textField.text = "\(textField.text!) x"
    }
    @IBAction func clickOver(_ sender: Any) {
        textField.text = "\(textField.text!) %"
    }
    @IBAction func clickLP(_ sender: Any) {
        textField.text = "\(textField.text!) ("
    }
    @IBAction func clickRP(_ sender: Any) {
        textField.text = "\(textField.text!) )"
    }
    @IBAction func clickClear(_ sender: Any) {
        textField.text = ""
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
