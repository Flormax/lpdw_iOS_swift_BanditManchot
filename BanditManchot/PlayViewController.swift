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
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var numberCoins: UILabel!
    @IBOutlet weak var logoPokemon: UIImageView!
    @IBOutlet weak var imgCoins: UIImageView!
    var coins:Int = 10
    var timer = NSTimer()
    var pickerData: [String] = [String]()
    var itemNameList = [String]()
    var selectedItemName = String()
    var itemPhotoList = [UIImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.numberCoins.text = String(coins)
        self.numberCoins.font = UIFont(name: numberCoins.font.fontName, size: 30)
        self.buttonImage.image = UIImage(named:"Image")
        self.imgBandit.image = UIImage(named:"background")
        self.logoPokemon.image = UIImage(named:"logo")
        self.imgCoins.image = UIImage(named:"coins")
        itemNameList = ["bulbi", "ratata", "goupix" , "pika" , "mew" , "mystherbe",
            "ronflex", "ectoplasma"]
        
        itemPhotoList.append(UIImage(named: "bulbi")!)
        itemPhotoList.append(UIImage(named: "ratata")!)
        itemPhotoList.append(UIImage(named: "goupix")!)
        itemPhotoList.append(UIImage(named: "pika")!)
        itemPhotoList.append(UIImage(named: "mew")!)
        itemPhotoList.append(UIImage(named: "mystherbe")!)
        itemPhotoList.append(UIImage(named: "ronflex")!)
        itemPhotoList.append(UIImage(named: "ectoplasma")!)

        
        picker.dataSource = self
        picker.delegate = self
        
        picker.selectRow(5, inComponent: 0, animated: false)
        picker.selectRow(5, inComponent: 1, animated: false)
        picker.selectRow(5, inComponent: 2, animated: false)
    }
    
    @IBAction func test(sender: UISwipeGestureRecognizer) {
        if(self.coins > 0)
        {
            self.buttonImage.image = UIImage(named:"Image-1")
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeButton", userInfo: nil, repeats: false)
            coins -= 1
            self.numberCoins.text = String(coins)
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "spin", userInfo: nil, repeats: true)
            //            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+950, inComponent: 0, animated: true)
            //            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+950, inComponent: 1, animated: true)
            //            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+950, inComponent: 2, animated: true)
        }
        
    }
    
    func spin(){
        
        picker.selectRow(Int(arc4random_uniform(UInt32(8)))+100, inComponent: 0, animated: true)
        picker.selectRow(Int(arc4random_uniform(UInt32(8)))+100, inComponent: 1, animated: true)
        picker.selectRow(Int(arc4random_uniform(UInt32(8)))+100, inComponent: 2, animated: true)
    }
    
    func changeButton(){
        self.buttonImage.image = UIImage(named:"Image")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, var viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        row = row % 8
        
        let view = UIView(frame: CGRectMake(0, 0, 50, 50))
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 50, 50))
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
        return 1000
    }
    
    
    // MARK: UIPickerViewDelegate functions
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
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