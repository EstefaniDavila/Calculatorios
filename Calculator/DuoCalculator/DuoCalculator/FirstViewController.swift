//
//  FirstViewController.swift
//  DuoCalculator
//
//  Created by Mac 13 on 10/6/21.
//  Copyright © 2021 empresa. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var txtFNum: UILabel!
    @IBOutlet weak var txtSimbol: UILabel!
    var numero1:Double = 0.0
    var numero2:Double = 0.0
    var Rpta:Double = 0.0
    
 func Limpiar(){
    self.txtField.text = ""
    self.txtSimbol.text = ""
    self.txtFNum.text = ""
    numero1 = 0
    numero2 = 0
    Rpta = 0
 }
    func Operacion(num1:String?,simbol:String){
       self.numero1 = Double(num1!)!
       self.txtSimbol.text = simbol
       self.txtFNum.text = num1
       self.txtField.text = ""
    }
    @IBAction func btnC(_ sender: Any) {
        Limpiar()
    }
    
    @IBAction func btnNega(_ sender: Any) {
        var num = Double(self.txtField.text!)
        num = (num! * (-1))
        self.txtField.text = String(num!)
    }
    
    @IBAction func btnPorcentaje(_ sender: Any) {
        var num = Double(self.txtField.text!)
        num = (num! / (100))
        self.txtField.text = String(num!)
    }
    
    
    @IBAction func btn7(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "7"
    }
    
    @IBAction func btn8(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "8"
    }
    @IBAction func btn9(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "9"
    }
    @IBAction func btn4(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "4"
    }
    @IBAction func btn5(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "5"
    }
    
    @IBAction func btn6(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "6"
    }
    
    @IBAction func btn1(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "1"
    }
    
    @IBAction func btn2(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "2"
    }
    
    @IBAction func btn3(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "3"
    }
    
    @IBAction func btn0(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "0"
    }
    
    @IBAction func btnP(_ sender: Any) {
        self.txtField.text = self.txtField.text! + "."
    }
    
    
    @IBAction func btnDiv(_ sender: Any) {
        Operacion(num1: self.txtField.text!, simbol: "/")
    }
    
    @IBAction func btnMulti(_ sender: Any) {
        Operacion(num1: self.txtField.text!, simbol: "x")
    }
    
    @IBAction func btnResta(_ sender: Any) {
        Operacion(num1: self.txtField.text!, simbol: "-")
    }
    
    
    @IBAction func btnSuma(_ sender: Any) {
        Operacion(num1: self.txtField.text!, simbol: "+")
    }
    
    @IBAction func btnRpta(_ sender: Any) {
        self.numero2 = Double(self.txtField.text!)!
        switch self.txtSimbol.text! {
        case "+":
            self.Rpta = self.numero1 + self.numero2
            self.txtField.text = String(self.Rpta)
            self.txtSimbol.text = ""
            self.txtFNum.text = ""
            self.numero1 = 0
            self.numero2 = 0
            self.Rpta = 0
        case "-":
            self.Rpta = self.numero1 - self.numero2
            self.txtField.text = String(self.Rpta)
            self.txtSimbol.text = ""
            self.txtFNum.text = ""
            self.numero1 = 0
            self.numero2 = 0
            self.Rpta = 0
        case "/":
            self.Rpta = self.numero1 / self.numero2
            self.txtField.text = String(self.Rpta)
            self.txtSimbol.text = ""
            self.txtFNum.text = ""
            self.numero1 = 0
            self.numero2 = 0
            self.Rpta = 0
        case "x":
            self.Rpta = self.numero1 * self.numero2
            self.txtField.text = String(self.Rpta)
            self.txtSimbol.text = ""
            self.txtFNum.text = ""
            self.numero1 = 0
            self.numero2 = 0
            self.Rpta = 0
        default:
            self.txtField.text = "ERR"
        }
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

