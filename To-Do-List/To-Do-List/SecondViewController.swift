//
//  SecondViewController.swift
//  To-Do-List
//
//  Created by admin on 30/03/17.
//  Copyright © 2017 ACE. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var inputToDo: UITextField!
    @IBAction func saveToDo(_ sender: AnyObject) {
        let itemObject = UserDefaults.standard.object(forKey: "item") //creating a userDefault objects
        let fetchData = inputToDo.text
        var item:[String] //Created an array of datatype String.
        
        print(itemObject)
        if let checkObjects = itemObject as? [String]{ //checking whether the itemObjects (UserDefaults) has any value as String or not
            item = checkObjects //Passing the existing userDefault to the current variable
            item.append(fetchData!) //Adding the new data into the array of items
        }
        else{
            item = [fetchData!] //entering the first the element into the array
        }
        inputToDo.text=" " //removing the entered text from the SecondViewController
        UserDefaults.standard.set(item, forKey: "item") //adding the items to userDefaults
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

