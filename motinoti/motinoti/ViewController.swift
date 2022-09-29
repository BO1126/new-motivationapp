//
//  ViewController.swift
//  motinoti
//
//  Created by 이정우 on 2022/09/22.
//

import UIKit
import SwiftyJSON
import Firebase

class ViewController: UIViewController {
    
    var ref : DatabaseReference!
    var data : [String : String] = [:]
    
    @IBOutlet weak var motiLabel : UILabel!
    @IBOutlet weak var personLabel : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = "https://motinoti-c993f-default-rtdb.asia-southeast1.firebasedatabase.app"
        ref = Database.database(url: url).reference()
        ref.child("MotivationList").observeSingleEvent(of: .value) {snapshot in
            if let value = snapshot.value as? [String : String] {
                self.data = value
                self.setText()
            }
        }
        
    }
    
    func setText(){
        if let randomMoti = self.data.randomElement(){
            self.motiLabel.text = randomMoti.value
            self.personLabel.text = randomMoti.key
        }else{
            self.motiLabel.text = "아니 얼마나"
            self.personLabel.text = "많이 넘겼으면"
        }
    }
    
    


}

