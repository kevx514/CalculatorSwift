//
//  ViewController.swift
//  Calculator
//
//  Created by kevin claros on 2/22/20.
//  Copyright © 2020 kevin claros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    var numberOnScreen: Double = 0;
    var previousNumber: Double = 0;
    var performingMath = false;
    var operation = 0;
   
   @IBOutlet weak var lblOutput: UILabel!
    
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
        
        if(lblOutput.text != "" && sender.tag != 11 && sender.tag != 18){
            
            previousNumber = Double(lblOutput.text!)!
            
            if(sender.tag == 14){ // Divide
                lblOutput.text = "/"
                
            }else if(sender.tag == 15){// Multiply
                lblOutput.text = "x"
                
            }else if(sender.tag == 16){// Subtract
                lblOutput.text = "-"
                
            }else if(sender.tag == 17){// Add
                lblOutput.text = "+"
            }
            operation = sender.tag
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
        }else if sender.tag == 11{
            lblOutput.text = ""
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

