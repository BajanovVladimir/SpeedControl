//
//  ViewController.swift
//  SpeedControlSystemRUS
//
//  Created by Владимир Бажанов on 26.08.2021.
//

import UIKit

class ViewController: UIViewController {

    var lightOn=true
    var modeInTheCity=true
        
    @IBOutlet weak var labelModeSpeed: UILabel!
   
    @IBOutlet weak var buttonUpdateUI: UIButton!
    
    @IBOutlet weak var buttonCIty: UIButton!
    
    @IBOutlet weak var textFieldYourSpeed: UITextField!
    
    @IBOutlet weak var labelDisplaingValues: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func updateUI(){
        view.backgroundColor=lightOn  ? .systemGray6 : .systemGreen
    }
    
    func speedControl(speed:Int, city:Bool) -> String {
        let citySped=60
        let outSideCitySpeed=90
        var amountOfTheFine=""
        var limitSpeed=citySped
        if city{
            limitSpeed=citySped
        } else {
            limitSpeed=outSideCitySpeed
        }
        let controlSpeed=speed-limitSpeed
        switch controlSpeed {
        case 20...40:
            amountOfTheFine="Штраф 500 рублей"
        case 40...60:
            amountOfTheFine="Штраф 1000 рублей"
        case 60...80:
            amountOfTheFine="Штраф 2000 рублей"
            
        case 80...:
            amountOfTheFine="Штраф 5000 руб"
        default:
            amountOfTheFine="Нет штрафа"
        }
        return amountOfTheFine
    }
   
    @IBAction func buttonUpdateUI(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
    
    @IBAction func buttonCityOn(_ sender: Any) {
        modeInTheCity.toggle()
        if modeInTheCity{
            buttonCIty.setTitle("Город", for: .normal)
        } else {
            buttonCIty.setTitle("Трасса", for: .normal)
        }
    }
    
    @IBAction func buttonCalculation(_ sender: Any) {
        if let speed:Int=Int(textFieldYourSpeed.text!){
            labelDisplaingValues.text=speedControl(speed: speed,city: modeInTheCity)
        } else{
            textFieldYourSpeed.text="Введите число"
        }
    }
}

