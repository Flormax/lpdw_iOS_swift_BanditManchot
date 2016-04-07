//
//  PlayViewController.swift
//  BanditManchot
//
//  Created by Maxime Florile on 06/04/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit
import PickerView

class PlayViewController: UIViewController, PickerViewDelegate, PickerViewDataSource {

    @IBOutlet weak var imgBandit: UIImageView!
    @IBOutlet weak var picker: PickerView!
    @IBOutlet weak var numberCoins: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    var coins:Int = 10
    var timer = NSTimer()
    var pickerData: [String] = [String]()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberCoins.text = String(coins)
        self.buttonImage.image = UIImage(named:"Image")
        self.imgBandit.image = UIImage(named:"Image-2")
        pickerData = ["1", "2", "3", "4"]
        
        picker.dataSource = self
        picker.delegate = self
        picker.scrollingStyle = .Infinite
    }
    
    @IBAction func test(sender: UISwipeGestureRecognizer) {
        if(self.coins > 0)
        {
            self.buttonImage.image = UIImage(named:"Image-1")
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeButton", userInfo: nil, repeats: false)
            coins -= 1
            self.numberCoins.text = String(coins)
        }
        
    }
    func changeButton(){
        self.buttonImage.image = UIImage(named:"Image")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfRowsInPickerView(pickerView: PickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: PickerView, titleForRow row: Int) -> String {
        return pickerData[row]
    }
        
    func pickerView(pickerView: PickerView, didSelectRow row: Int) {
        print("The selected item is \(pickerData[row])")
    }
    
    func heightForRowInPickerView(pickerView: PickerView) -> CGFloat {
        return 50.0 // In this example I'm returning arbitrary 50.0pt but you can return the row height you want.
    }
    
    func styleForLabel(label: UILabel, inPickerView pickerView: PickerView) {
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(15.0)
        label.textColor = .lightGrayColor()
    }
    
    func styleForHighlightedLabel(label: UILabel, inPickerView pickerView: PickerView) {
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(25.0) // Change the size of font
        label.textColor = view.tintColor // Change the text color
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
