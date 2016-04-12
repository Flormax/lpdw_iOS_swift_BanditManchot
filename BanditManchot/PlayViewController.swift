//
//  PlayViewController.swift
//  BanditManchot
//
//  Created by Maxime Florile on 06/04/2016.
//  Copyright © 2016 Maxime Florile. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var logo: UIImageView!

    @IBOutlet weak var numberPlays: UILabel!
    @IBOutlet weak var rota: UIImageView!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var results3: UILabel!
    @IBOutlet weak var results2: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var imgBandit: UIImageView!
    @IBOutlet weak var buttonImage: UIImageView!
    @IBOutlet weak var numberCoins: UILabel!
    @IBOutlet weak var logoPokemon: UIImageView!
    @IBOutlet weak var imgCoins: UIImageView!
    var coins: Int = 10
    var plays: Int = 0
    var timer = NSTimer()
    var pickerData: [String] = [String]()
    var itemList1 =  [Int: [String: UIImage]]()
    var itemList2 =  [Int: [String: UIImage]]()
    var itemList3 =  [Int: [String: UIImage]]()
    var winCoins: Int = 0
    var j:Int = 0
    @IBOutlet weak var results: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.numberPlays.text = String(plays)
        self.numberPlays.font = UIFont(name: numberCoins.font.fontName, size: 30)
        self.numberCoins.text = String(coins)
        self.numberCoins.font = UIFont(name: numberCoins.font.fontName, size: 30)
        //self.logo.image = UIImage(named:"logo")
        self.background.image = UIImage(named:"logobackground")
        self.imgCoins.image = UIImage(named:"coins")
        self.rota.image = UIImage(named:"rota")
        
        itemList1[0] = ["ronflex": UIImage(named: "ronflex")!]
        itemList1[1] = ["bulbi": UIImage(named: "bulbi")!]
        itemList1[2] = ["ratata": UIImage(named: "ratata")!]
        itemList1[3] = ["ronflex": UIImage(named: "ronflex")!]
        itemList1[4] = ["bulbi": UIImage(named: "bulbi")!]
        itemList1[5] = ["ratata": UIImage(named: "ratata")!]
        itemList1[6] = ["mew": UIImage(named: "mew")!]
        itemList1[7] = ["ronflex": UIImage(named: "ronflex")!]
        itemList1[8] = ["ratata": UIImage(named: "ratata")!]
        itemList1[9] = ["pika": UIImage(named: "pika")!]
        
        itemList2[0] = ["ronflex": UIImage(named: "ronflex")!]
        itemList2[1] = ["ratata": UIImage(named: "ratata")!]
        itemList2[2] = ["mew": UIImage(named: "mew")!]
        itemList2[3] = ["ratata": UIImage(named: "ratata")!]
        itemList2[4] = ["pika": UIImage(named: "pika")!]
        itemList2[5] = ["ronflex": UIImage(named: "ronflex")!]
        itemList2[6] = ["bulbi": UIImage(named: "bulbi")!]
        itemList2[7] = ["ronflex": UIImage(named: "ronflex")!]
        itemList2[8] = ["bulbi": UIImage(named: "bulbi")!]
        itemList2[9] = ["ratata": UIImage(named: "ratata")!]
        
        
        itemList3[0] = ["ratata": UIImage(named: "ratata")!]
        itemList3[1] = ["bulbi": UIImage(named: "bulbi")!]
        itemList3[2] = ["ronflex": UIImage(named: "ronflex")!]
        itemList3[3] = ["ratata": UIImage(named: "ratata")!]
        itemList3[4] = ["bulbi": UIImage(named: "bulbi")!]
        itemList3[5] = ["ratata": UIImage(named: "ratata")!]
        itemList3[6] = ["ronflex": UIImage(named: "ronflex")!]
        itemList3[7] = ["pika": UIImage(named: "pika")!]
        itemList3[8] = ["mew": UIImage(named: "mew")!]
        itemList3[9] = ["ratata": UIImage(named: "ratata")!]
        
        
        picker.dataSource = self
        picker.delegate = self
        //picker.userInteractionEnabled = false
        
        picker.layer.borderWidth = 1
        picker.backgroundColor = UIColor.whiteColor()
        
        picker.selectRow(5, inComponent: 0, animated: false)
        picker.selectRow(5, inComponent: 1, animated: false)
        picker.selectRow(5, inComponent: 2, animated: false)
    }
    
    @IBAction func test(sender: UISwipeGestureRecognizer) {
        if(self.coins > 0)
        {
            plays += 1
            self.numberPlays.text = String(plays)
            j = 50
            picker.selectRow(995, inComponent: 0, animated: false)
            picker.selectRow(995, inComponent: 1, animated: false)
            picker.selectRow(995, inComponent: 2, animated: false)
            
            coins -= 1
            self.numberCoins.text = String(coins)
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "spin", userInfo: nil, repeats: true)
        }
        
    }
    func spin(){
        
        if j < 930 {
            NSLog(String(j))
            let k: Int = 995 - j
            picker.selectRow(Int(arc4random_uniform(UInt32(10)))+k, inComponent: 0, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(10)))+k, inComponent: 1, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(10)))+k, inComponent: 2, animated: true)
            j += 40
            print(arc4random_uniform(UInt32(10)))
        }
        else
        {
            NSLog(String(j))
            timer.invalidate()
            let k: Int = 995 - j
            NSLog(String(k))
            picker.selectRow(Int(arc4random_uniform(UInt32(10)))+(k-10), inComponent: 0, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(10)))+(k-10), inComponent: 1, animated: true)
            picker.selectRow(Int(arc4random_uniform(UInt32(10)))+(k-10), inComponent: 2, animated: true)
            var seconds = 0.3
            var delay = seconds * Double(NSEC_PER_SEC)  // nanoseconds per seconds
            var dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.picker.selectRow(Int(arc4random_uniform(UInt32(10)))+(k-16), inComponent: 1, animated: true)
                self.picker.selectRow(Int(arc4random_uniform(UInt32(10)))+(k-16), inComponent: 2, animated: true)
            })
            
            seconds = 0.6
            delay = seconds * Double(NSEC_PER_SEC)
            dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                self.picker.selectRow(Int(arc4random_uniform(UInt32(10)))+(k-24), inComponent: 2, animated: true)
            })
            seconds = 1.0
            delay = seconds * Double(NSEC_PER_SEC)
            dispatchTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            
            dispatch_after(dispatchTime, dispatch_get_main_queue(), {
                let spin1:Int = self.picker.selectedRowInComponent(0)%10
                let spin2:Int = self.picker.selectedRowInComponent(1)%10
                let spin3:Int = self.picker.selectedRowInComponent(2)%10
                
                self.calculCoinsWin(spin1, spin2: spin2, spin3: spin3)
            })


        }
    }

    func showModal() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .OverCurrentContext
        presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(pickerView: UIPickerView, var viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        row = row % 10
        
        let view = UIView(frame: CGRectMake(0, 0, 50, 50))
        
        let imageView = UIImageView(frame: CGRectMake(0, 0, 50, 50))
        
        switch component {
        case 1:
            let image = itemList2[row]
            let keys = image?.keys
            imageView.image = image![(keys?.first)!]
        case 2:
            let image = itemList3[row]
            let keys = image?.keys
            imageView.image = image![(keys?.first)!]
        default:
            let image = itemList1[row]
            let keys = image?.keys
            imageView.image = image![(keys?.first)!]
        }
        view.addSubview(imageView)
        return view
    }
    
    func calculCoinsWin(spin1: Int,spin2: Int,spin3: Int)
    {
        
        let spin1row1: Int = (spin1 == 0 ? 9 : spin1-1)
        let spin1row2: Int = spin1
        let spin1row3: Int = (spin1 == 9 ? 0 : spin1+1)
        
        let spin2row1: Int = (spin2 == 0 ? 9 : spin2-1)
        let spin2row2: Int = spin2
        let spin2row3: Int = (spin2 == 9 ? 0 : spin2+1)
        
        let spin3row1: Int = (spin3 == 0 ? 9 : spin3-1)
        let spin3row2: Int = spin3
        let spin3row3: Int = (spin3 == 9 ? 0 : spin3+1)
        
        let resultTab: [[String]] = [
            [itemList1[spin1row1]!.keys.first!,itemList2[spin2row1]!.keys.first!,itemList3[spin3row1]!.keys.first!],
            [itemList1[spin1row2]!.keys.first!,itemList2[spin2row2]!.keys.first!,itemList3[spin3row2]!.keys.first!],
            [itemList1[spin1row3]!.keys.first!,itemList2[spin2row3]!.keys.first!,itemList3[spin3row3]!.keys.first!]
        ]
        
        self.results.text = itemList1[spin1row1]!.keys.first! + itemList2[spin2row1]!.keys.first! + itemList3[spin3row1]!.keys.first!
        self.results2.text = itemList1[spin1row2]!.keys.first! + itemList2[spin2row2]!.keys.first! + itemList3[spin3row2]!.keys.first!
        self.results3.text = itemList1[spin1row3]!.keys.first! + itemList2[spin2row3]!.keys.first! + itemList3[spin3row3]!.keys.first!
        
        // Ligne du haut
        if(itemList1[spin1row1]!.keys.first! == itemList2[spin2row1]!.keys.first! &&
            itemList2[spin2row1]!.keys.first! == itemList3[spin3row1]!.keys.first!){
            switch itemList1[spin1row1]!.keys.first!{
            case "ratata":
                winCoins = 1*2
                self.coins += winCoins
            case "bulbi":
                winCoins = 2*2
                self.coins += winCoins
            case "pika":
                winCoins = 3*2
                self.coins += winCoins
            case "ronflex":
                winCoins = 3*2
                self.coins += winCoins
            case "mew":
                winCoins = 10*2
                self.coins += winCoins
            default:
                self.coins += 0
            }
            self.results.text = "Bravo ! Ligne du haut: "+itemList1[spin1row1]!.keys.first!
            self.results2.text = "Multiplicateur x2 !!"
            self.results3.text = "Vous avez gagné: "+String(winCoins)
        }
        //Ligne du milieu
        if(itemList1[spin1row2]!.keys.first! == itemList2[spin2row2]!.keys.first! &&
            itemList2[spin2row2]!.keys.first! == itemList3[spin3row2]!.keys.first!){
            switch itemList1[spin1row2]!.keys.first!{
            case "ratata":
                winCoins = 1*3
                self.coins += winCoins
            case "bulbi":
                winCoins = 2*3
                self.coins += winCoins
            case "pika":
                winCoins = 3*3
                self.coins += winCoins
            case "ronflex":
                winCoins = 3*3
                self.coins += winCoins
            case "mew":
                winCoins = 10*3
                self.coins += winCoins
            default:
                self.coins += 0
            }
            self.results.text = "Bravo ! Ligne du Milieu: "+itemList1[spin1row2]!.keys.first!
            self.results2.text = "Multiplicateur x3 !!"
            self.results3.text = "Vous avez gagné: "+String(winCoins)
        }
        //Ligne du bas
        if(itemList1[spin1row3]!.keys.first! == itemList2[spin2row3]!.keys.first! &&
            itemList2[spin2row3]!.keys.first! == itemList3[spin3row3]!.keys.first!){
            switch itemList1[spin1row3]!.keys.first!{
            case "ratata":
                winCoins = 1*2
                self.coins += winCoins
            case "bulbi":
                winCoins = 2*2
                self.coins += winCoins
            case "pika":
                winCoins = 3*2
                self.coins += winCoins
            case "ronflex":
                winCoins = 3*2
                self.coins += winCoins
            case "mew":
                winCoins = 10*2
                self.coins += winCoins
            default:
                self.coins += 0
            }
            self.results.text = "Bravo ! Ligne du Bas: "+itemList1[spin1row3]!.keys.first!
            self.results2.text = "Multiplicateur x2 !!"
            self.results3.text = "Vous avez gagné: "+String(winCoins)
        }
        //Diagonale 1
        if(itemList1[spin1row1]!.keys.first! == itemList2[spin2row2]!.keys.first! &&
            itemList2[spin2row2]!.keys.first! == itemList3[spin3row3]!.keys.first!){
            switch itemList1[spin1row1]!.keys.first!{
            case "ratata":
                winCoins = 1
                self.coins += winCoins
            case "bulbi":
                winCoins = 2
                self.coins += winCoins
            case "pika":
                winCoins = 3
                self.coins += winCoins
            case "ronflex":
                winCoins = 3
                self.coins += winCoins
            case "mew":
                winCoins = 10
                self.coins += winCoins
            default:
                self.coins += 0
            }
            self.results.text = "Bravo ! Diagonale: "+itemList1[spin1row1]!.keys.first!
            self.results2.text = "Pas de multiplicateur !"
            self.results3.text = "Vous avez gagné: "+String(winCoins)
        }
        //Diagonale 2
        if(itemList1[spin1row3]!.keys.first! == itemList2[spin2row2]!.keys.first! &&
            itemList2[spin2row2]!.keys.first! == itemList3[spin3row1]!.keys.first!){
            switch itemList1[spin1row3]!.keys.first!{
            case "ratata":
                winCoins = 1
                self.coins += winCoins
            case "bulbi":
                winCoins = 2
                self.coins += winCoins
            case "pika":
                winCoins = 3
                self.coins += winCoins
            case "ronflex":
                winCoins = 3
                self.coins += winCoins
            case "mew":
                winCoins = 10
                self.coins += winCoins
            default:
                self.coins += 0
            }
            self.results.text = "Bravo ! Diagonale: "+itemList1[spin1row3]!.keys.first!
            self.results2.text = "Pas de multiplicateur !"
            self.results3.text = "Vous avez gagné: "+String(winCoins)+"pièces."
        }
        self.numberCoins.text = String(coins)
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