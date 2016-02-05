//
//  ViewController.swift
//  PeticionOpenLibrary
//
//  Created by Fernando Renteria on 31/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valorISBN: UITextField!
    @IBOutlet weak var resultadoISBN: UITextView!
    
    @IBAction func buscarValorISBN(sender: UITextField) {
        // https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:978-84-376-0494-7
        let isbn : String = valorISBN.text!
        let urls = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + isbn
        let url = NSURL(string: urls)
        let JSONData : NSData? = NSData(contentsOfURL: url!)
        if (JSONData == nil) {
            resultadoISBN.text = "Recurso no accesible"
        
        }
        else {
        do {
            let JSON = try NSJSONSerialization.JSONObjectWithData(JSONData!, options:NSJSONReadingOptions(rawValue: 0))
            guard let JSONDictionary :NSDictionary = JSON as? NSDictionary else {
                resultadoISBN.text = "Recurso no accesible"
                // put in function
                return
            }
            resultadoISBN.text = String(format:"%@", JSONDictionary)
        }
        catch let JSONError as NSError {
            resultadoISBN.text = "\(JSONError)"
            print("\(JSONError)")
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

