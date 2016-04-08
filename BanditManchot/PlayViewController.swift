//
//  PlayViewController.swift
//  BanditManchot
//
//  Created by Maxime Florile on 06/04/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var results3: UILabel!
    @IBOutlet weak var results2: UILabel!
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
    var j:Int = 0
    @IBOutlet weak var results: UILabel!
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
        picker.userInteractionEnabled = false
        
        picker.selectRow(5, inComponent: 0, animated: false)
        picker.selectRow(5, inComponent: 1, animated: false)
        picker.selectRow(5, inComponent: 2, animated: false)
    }
    
    @IBAction func test(sender: UISwipeGestureRecognizer) {
        if(self.coins > 0)
        {
            j = 50
            picker.selectRow(995, inComponent: 0, animated: false)
            picker.selectRow(995, inComponent: 1, animated: false)
            picker.selectRow(995, inComponent: 2, animated: false)
            self.buttonImage.image = UIImage(named:"Image-1")
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "changeButton", userInfo: nil, repeats: false)
            coins -= 1
            self.numberCoins.text = String(coins)
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "spin", userInfo: nil, repeats: true)
        }
        
    }
    func spin(){
        
        if j < 930 {
            NSLog(String(j))
            let k: Int = 995 - j
            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+k, inComponent: 0, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+k, inComponent: 1, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+k, inComponent: 2, animated: true)
            j += 40
        }
        else
        {
            NSLog(String(j))
            timer.invalidate()
            let k: Int = 995 - j
            NSLog(String(k))
            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+(k-8), inComponent: 0, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+(k-8), inComponent: 1, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(8)))+(k-8), inComponent: 2, animated: true)
            var seconds = 0.3
            var delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.picker.selectRow(Int(arc4random_uniform(UInt32(8)))+(k-16), inComponent: 1, animated: true)
                self.picker.selectRow(Int(arc4random_uniform(UInt32(8)))+(k-16), inComponent: 2, animated: true)
            })
            
            seconds = 0.6
            delay = seconds * Double(NSEC_PER_SEC)
            dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.picker.selectRow(Int(arc4random_uniform(UInt32(8)))+(k-24), inComponent: 2, animated: true)
            })
            seconds = 1.0
            delay = seconds * Double(NSEC_PER_SEC)
            dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                let spin1:Int = self.picker.selectedRowInComponent(0)%8
                let spin2:Int = self.picker.selectedRowInComponent(1)%8
                let spin3:Int = self.picker.selectedRowInComponent(2)%8
                
                self.calculCoinsWin(spin1, spin2: spin2, spin3: spin3)
            })


        }
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
    func calculCoinsWin(spin1: Int,spin2: Int,spin3: Int)
    {
        
        var spin1row1: Int = (spin1 == 0 ? 7 : spin1-1)
        var spin1row2: Int = spin1
        var spin1row3: Int = (spin1 == 7 ? 0 : spin1+1)
        
        var spin2row1: Int = (spin2 == 0 ? 7 : spin2-1)
        var spin2row2: Int = spin2
        var spin2row3: Int = (spin2 == 7 ? 0 : spin2+1)
        
        var spin3row1: Int = (spin3 == 0 ? 7 : spin3-1)
        var spin3row2: Int = spin3
        var spin3row3: Int = (spin3 == 7 ? 0 : spin3+1)
        
        var resultTab: [[String]] = [
                                        [itemNameList[spin1row1],itemNameList[spin2row1],itemNameList[spin3row1]],
                                        [itemNameList[spin1row2],itemNameList[spin2row2],itemNameList[spin3row2]],
                                        [itemNameList[spin1row3],itemNameList[spin2row3],itemNameList[spin3row3]]
                                    ]
        
        self.results.text = itemNameList[spin1row1] + itemNameList[spin2row1] + itemNameList[spin3row1]
        self.results2.text = itemNameList[spin1row2] + itemNameList[spin2row2] + itemNameList[spin3row2]
        self.results3.text = itemNameList[spin1row3] + itemNameList[spin2row3] + itemNameList[spin3row3]
        // Ligne du haut
        if(itemNameList[spin1row1] == itemNameList[spin2row1] && itemNameList[spin2row1] == itemNameList[spin3row1]){
            switch itemNameList[spin1row1]{
            case "ratata":
                self.coins += spin1*2
            case "bulbi":
                self.coins += spin1*2
            case "goupix":
                self.coins += spin1*2
            case "pika":
                self.coins += spin1*2
            case "mystherbe":
                self.coins += spin1*2
            case "ectoplasma":
                self.coins += spin1*2
            case "ronflex":
                self.coins += spin1*2
            case "mew":
                self.coins += spin1*2
            default:
                self.coins += 0
            }
            self.results.text = "Ligne du haut"
        }
        //Ligne du milieu
        if(itemNameList[spin1row2] == itemNameList[spin2row2] && itemNameList[spin2row2] == itemNameList[spin3row2]){
            switch itemNameList[spin1row2]{
                case "ratata":
                    self.coins += spin1*3
                case "bulbi":
                    self.coins += spin1*3
                case "goupix":
                    self.coins += spin1*3
                case "pika":
                    self.coins += spin1*3
                case "mystherbe":
                    self.coins += spin1*3
                case "ectoplasma":
                    self.coins += spin1*3
                case "ronflex":
                    self.coins += spin1*3
                case "mew":
                    self.coins += spin1*3
                default:
                    self.coins += 0
            }
            self.results.text = "Ligne du milieu"
        }
        //Ligne du bas
        if(itemNameList[spin1row3] == itemNameList[spin2row3] && itemNameList[spin2row3] == itemNameList[spin3row3]){
            switch itemNameList[spin1row3]{
            case "ratata":
                self.coins += spin1*2
            case "bulbi":
                self.coins += spin1*2
            case "goupix":
                self.coins += spin1*2
            case "pika":
                self.coins += spin1*2
            case "mystherbe":
                self.coins += spin1*2
            case "ectoplasma":
                self.coins += spin1*2
            case "ronflex":
                self.coins += spin1*2
            case "mew":
                self.coins += spin1*2
            default:
                self.coins += 0
            }
            self.results.text = "Ligne du bas"
        }
        //Diagonale 1
        if(itemNameList[spin1row1] == itemNameList[spin2row2] && itemNameList[spin2row2] == itemNameList[spin3row3]){
            switch itemNameList[spin1row1]{
            case "ratata":
                self.coins += spin1
            case "bulbi":
                self.coins += spin1
            case "goupix":
                self.coins += spin1
            case "pika":
                self.coins += spin1
            case "mystherbe":
                self.coins += spin1
            case "ectoplasma":
                self.coins += spin1
            case "ronflex":
                self.coins += spin1
            case "mew":
                self.coins += spin1
            default:
                self.coins += 0
            }
            self.results.text = "diagonale1"
        }
        //Diagonale 2
        if(itemNameList[spin1row1] == itemNameList[spin2row2] && itemNameList[spin2row2] == itemNameList[spin3row3]){
            switch itemNameList[spin1row3]{
            case "ratata":
                self.coins += spin1
            case "bulbi":
                self.coins += spin1
            case "goupix":
                self.coins += spin1
            case "pika":
                self.coins += spin1
            case "mystherbe":
                self.coins += spin1
            case "ectoplasma":
                self.coins += spin1
            case "ronflex":
                self.coins += spin1
            case "mew":
                self.coins += spin1
            default:
                self.coins += 0
            }
            self.results.text = "diagonale 2"
        }
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