//
//  PlayViewController.swift
//  BanditManchot
//
//  Created by Maxime Florile on 06/04/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var imgBandit: UIImageView!
    @IBOutlet weak var numberCoins: UILabel!
    @IBOutlet weak var buttonImage: UIImageView!
    var coins:Int = 10
    var timer = NSTimer()
    var pickerData: [String] = [String]()
    var itemNameList = [String]()
    var selectedItemName = String()
    var itemPhotoList = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberCoins.text = String(coins)
        self.buttonImage.image = UIImage(named:"Image")
        self.imgBandit.image = UIImage(named:"Image-2")
        
        itemNameList = ["bar", "bar", "bar" , "bar" , "bar" , "bar",
            "bar", "bar", "bar" , "bar" , "bar" , "bar",
            "bar", "bar", "bar" , "bar" , "bar" , "bar"]
        
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)
        itemPhotoList.append(UIImage(named: "bar")!)

        
        picker.dataSource = self
        picker.delegate = self
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
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let view = UIView(frame: CGRectMake(0, 0, 30, 30))
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 30, 30))
        imageView.image = itemPhotoList[row]
        
        let labelView = UILabel(frame: CGRectMake(0, 0, 0, 0))
        labelView.text = itemNameList[row]
        
        view.addSubview(imageView)
        view.addSubview(labelView)
        
        return view
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return itemNameList.count
    }
    
    
    // MARK: UIPickerViewDelegate functions
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
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
