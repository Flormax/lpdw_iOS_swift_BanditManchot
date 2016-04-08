//
//  HowToViewController.swift
//  BanditManchot
//
//  Created by Maxime Florile on 06/04/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {
    
    @IBOutlet weak var bulbiImg: UIImageView!
    @IBOutlet weak var bulbiImg2: UIImageView!
    @IBOutlet weak var bulbiImg3: UIImageView!
    
    
    var colorString = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bulbiImg.image = UIImage(named:"bulbi")
        self.bulbiImg2.image = UIImage(named:"bulbi")
        self.bulbiImg3.image = UIImage(named:"bulbi")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
