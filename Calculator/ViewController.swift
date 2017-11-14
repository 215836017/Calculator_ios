//
//  ViewController.swift
//  Calculator
//
//  Created by fengzq on 2017/10/18.
//  Copyright © 2017年 fengzq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var num01 : Float = 0.0
    var num02 : Float = 0.0
    var result : Float = 0.0
    var strNum1 : String = ""
    var strNum2 : String = ""
    
    var isFristInput = true
    var isSecondInput = true
    var flagOpt = -1
    
    @IBOutlet var labelShowNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelShowNum.text = String(0)
        isFristInput = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //加法
    @IBAction func btnAdd(_ sender: Any) {
        flagOpt = 0
        strNum1 = labelShowNum.text!
        if strNum1 == ""{
            return
        }
        if strNum1.last == "."{
            strNum1.removeLast()
        }
        num01 = Float(strNum1)!
        labelShowNum.text = strNum1 + " + "
    }
    
    //减法
    @IBAction func btnSubtraction(_ sender: Any) {
        flagOpt = 1
        strNum1 = labelShowNum.text!
        if strNum1 == ""{
            return
        }
        if strNum1.last == "."{
            strNum1.removeLast()
        }
        num01 = Float(strNum1)!
       labelShowNum.text = strNum1 + " - "
    }
    
   
    //乘法
    @IBAction func btnMultiplication(_ sender: UIButton) {
       flagOpt = 2
        strNum1 = labelShowNum.text!
        if strNum1 == ""{
            return
        }
        if strNum1.last == "."{
            strNum1.removeLast()
        }
        num01 = Float(strNum1)!
        labelShowNum.text = strNum1 + " x "
    }
    //除法
    @IBAction func btnDivision(_ sender: Any) {
        flagOpt = 3
        strNum1 = labelShowNum.text!
        if strNum1 == ""{
            return
        }
        if strNum1.last == "."{
            strNum1.removeLast()
        }
        num01 = Float(strNum1)!
        labelShowNum.text = strNum1 + " / "
    }
    
    //等于号
    @IBAction func btnEqual(_ sender: Any) {

        if strNum2.last == "."{
            strNum2.removeLast()
        }
        
        num02 = Float(strNum2)!
        
        switch flagOpt {
        case 0:
            result = num01 + num02
        case 1:
            result = num01 - num02
        case 2:
            result = num01 * num02
        case 3:
            if num02 == 0{
             print("除数不能为0")
            }else{
            result = num01 / num02
            }
        default:
            print("Error!")
            return
        }
        
        labelShowNum.text = String(result)
        num01 = 0.0
        num02 = 0.0
        result = 0.0
        isFristInput = true
        flagOpt = -1
        strNum2 = ""
        strNum1 = ""
        
    }
    
    
    //退格
    @IBAction func btnBack(_ sender: Any) {
        var str : String = labelShowNum.text!
        if str.count < 1 {
            return
        }
        
        let ch = str.removeLast()
        if ch == "+" || ch == "-" || ch == "x" || ch == "/"{
            flagOpt = -1
            str.removeLast()
        }
        labelShowNum.text = str
    }
    
    //清空
    @IBAction func btnClear(_ sender: Any) {
        labelShowNum.text = "0"
        num01 = 0.0
        num02 = 0.0
        result = 0.0
        isFristInput = true
        flagOpt = -1
        strNum2 = ""
        strNum1 = ""
    }
    
    //获取数字
    @IBAction func getNum(_ sender: UIButton) {
        if isFristInput{
            labelShowNum.text = ""
            isFristInput = false
        }
        if flagOpt != -1{
            if strNum2 == "0"{  // 考虑到0.情况下点了退格键
            strNum2 = (sender.titleLabel?.text)!
            }else{
                strNum2 = strNum2 + (sender.titleLabel?.text)!
            }
        }
         labelShowNum.text = labelShowNum.text! + (sender.titleLabel?.text)!
       
    }
    
    
    //小数点的点击事件
    @IBAction func getPoint(_ sender: Any) {
        if flagOpt == -1{
            if isFristInput {
                labelShowNum.text = "0."
                isFristInput = false
            }else{
                labelShowNum.text = labelShowNum.text! + "."
            }
        }
        
        if flagOpt != -1 {
            if strNum2.isEmpty{
                strNum2 = "0."
                 labelShowNum.text = labelShowNum.text! + "0."
            }else{
                strNum2 = strNum2 + "."
                 labelShowNum.text = labelShowNum.text! + "."
            }
            
           
         
        }
    }
    
    
    
}

