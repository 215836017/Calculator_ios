//
//  ViewController.swift
//  Calculator
//
//  Created by fengzq on 2017/10/18.
//  Copyright © 2017年 fengzq. All rights reserved.
//

import UIKit

/**
 代码参考链接：
http://blog.csdn.net/qq_29284809/article/details/50803536
http://blog.csdn.net/tujiaw/article/details/44132419
 */
class ViewController: UIViewController {
   
    var num01 : Float = 0.0
    var num02 : Float = 0.0
    var result : Float = 0.0
    
    var isFristInput = true
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
        num01 = Float(labelShowNum.text!)!
        labelShowNum.text = labelShowNum.text! + " + "
    }
    
    //减法
    @IBAction func btnSubtraction(_ sender: Any) {
        flagOpt = 1
        num01 = Float(labelShowNum.text!)!
        labelShowNum.text = labelShowNum.text! + " - "
    }
    
   
    //乘法
    @IBAction func btnMultiplication(_ sender: UIButton) {
       flagOpt = 2
        num01 = Float(labelShowNum.text!)!
        labelShowNum.text = labelShowNum.text! + " x "
    }
    //除法
    @IBAction func btnDivision(_ sender: Any) {
        flagOpt = 3
        num01 = Float(labelShowNum.text!)!
        labelShowNum.text = labelShowNum.text! + " / "
    }
    
    //等于号
    @IBAction func btnEqual(_ sender: Any) {

        switch flagOpt {
        case 0:
            result = num01 + num02
        case 1:
            result = num01 - num02
        case 2:
            result = num01 * num02
        case 3:
            result = num01 / num02
            
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
        
    }
    
    
    //退格
    @IBAction func btnBack(_ sender: Any) {
        var str : String = labelShowNum.text!
        let ch = str.removeLast()
        if ch == "+" || ch == "-" || ch == "x" || ch == "/"{
            flagOpt = -1
        }
        labelShowNum.text = str
    }
    
    //清空
    @IBAction func btnClear(_ sender: Any) {
        labelShowNum.text = String(0)
        isFristInput = true
    }
    
    //获取数字
    @IBAction func getNum(_ sender: UIButton) {
        if isFristInput{
            labelShowNum.text = ""
            isFristInput = false
        }
        if flagOpt != -1{
            num02 = num02 + Float((sender.titleLabel?.text)!)!
        }
         labelShowNum.text = labelShowNum.text! + (sender.titleLabel?.text)!
       
    }
    
    
}

