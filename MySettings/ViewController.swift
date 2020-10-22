//
//  ViewController.swift
//  MySettings
//
//  Created by Lucy on 10/22/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fullname: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    

    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var favoritecolor: UITextField!
    
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
            defaults.set(self.fullname.text, forKey: "fullname")
            defaults.set(self.email.text, forKey: "email")
            defaults.set(self.username.text, forKey: "username")
            defaults.set(self.password.text, forKey: "password")
            defaults.set(self.favoritecolor.text, forKey: "favoritecolor")
              let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
            defaults.set(newDate, forKey: "bdate")
            print(datepicker.date.description)
            defaults.synchronize()
            clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
            if defaults.string(forKey: "fullname") != nil{
             fullname.text = defaults.string(forKey: "fullname")
        }
          if defaults.string(forKey: "email") != nil{
          email.text = defaults.string(forKey: "email")
         }
          if defaults.string(forKey: "username") != nil{
          username.text = defaults.string(forKey: "username")
         }
         if defaults.string(forKey: "password") != nil{
            password.text = defaults.string(forKey: "password")
         }
         if defaults.string(forKey: "favoritecolor") != nil{
            favoritecolor.text = defaults.string(forKey: "favoritecolor")
            
         }
         if defaults.string(forKey: "bdate") != nil{
              let bdate  = defaults.string(forKey: "bdate")
              let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
              let date = dateFormatter.date(from: bdate!) //according to date format your date string
                  datepicker.setDate(date!, animated: true)
              }
    }
    
   func clear()
   {
        fullname.resignFirstResponder()
        email.resignFirstResponder()
        username.resignFirstResponder()
        password.resignFirstResponder()
        favoritecolor.resignFirstResponder()
    
   }


}



