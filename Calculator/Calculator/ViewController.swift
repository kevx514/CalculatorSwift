//
//  ViewController.swift
//  Calculator
//
//  Created by kevin claros on 2/22/20.
//  Copyright © 2020 kevin claros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblOutput: UILabel!
    
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var sinus: Double = 0;
    var cosinus: Double = 0;
    var tangent: Double = 0;
    var pi: Double = 0;
    var operation = 0;

    
    @IBAction func btnNumbers(_ sender: UIButton) {
        if performingMath == true{
            lblOutput.text = String(sender.tag-1)
            numberOnScreen = Double(lblOutput.text!)!
            performingMath = false;
        }else{
            lblOutput.text = lblOutput.text! + String(sender.tag-1)
            numberOnScreen = Double(lblOutput.text!)!
        }
    }
    
    
    @IBAction func btnOperations(_ sender: UIButton) {

        
        if(lblOutput.text != "0" && sender.tag != 11 && sender.tag != 18){
            
            previousNumber = Double(lblOutput.text!)!
            operation = sender.tag
            
            if(sender.tag == 12){ // Sign
                if(previousNumber > 0){
                    previousNumber *= -1;
                    lblOutput.text = String(previousNumber);
                }else if(previousNumber < 0 ){
                    previousNumber = (0 - previousNumber);
                }
                
            }else if(operation == 13){ // Percent
                performingMath = true;
                numberOnScreen = Double(lblOutput.text!)!
                lblOutput.text = String(numberOnScreen * 0.01)
            }
            else if(sender.tag == 14){ // Divide
                lblOutput.text = "/"
                
            }else if(sender.tag == 15){// Multiply
                lblOutput.text = "x"
                
            }else if(sender.tag == 16){// Subtract
                lblOutput.text = "-"
                
            }
           
            
            
            performingMath = true;
            
            
        }
            
        else if sender.tag == 18{

             if operation == 14{
                lblOutput.text = String(previousNumber / numberOnScreen)

            }
            else if operation == 15{
                lblOutput.text = String(previousNumber * numberOnScreen)

            }
            else if operation == 16{
                lblOutput.text = String(previousNumber - numberOnScreen)

            }
            else if operation == 17{
                lblOutput.text = String(previousNumber + numberOnScreen)
            }
            
        }
            
            
            else if(sender.tag == 19){
            lblOutput.text = "Sin(";
            performingMath = true;
                   }
            else if(sender.tag == 20){
            lblOutput.text = "Cos(";
            performingMath = true;
                   }
            else if(sender.tag == 21){
                       lblOutput.text = "Tan(";
            performingMath = true;
                   }
        else if sender.tag == 11{
            lblOutput.text = "0"
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    

    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }
    
    override func didReceiveMemoryWarning() {

    super.didReceiveMemoryWarning()

    // Dispose of any resources that can be recreated.

    }

}

