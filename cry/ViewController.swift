//
//  ViewController.swift
//  cry
//
//  Created by Karan Gandhi on 11/17/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getData()
    }


    let url = "https://min-api.cryptocompare.com/data/price?tsyms=USD&fsym=btc"
    
    
    
    func getData() {
        
        
        //1. Initialize URL
        
        
        guard let url = URL(string: url) else {return}
        
        //2. Initialize Task and URL Session
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
            
            //3 Check Optionals
            guard let data = data, error == nil else {return}
            
            print("Data received")
            
            
            do {
                
                let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                
             
                print(Result.USD)
                
            }
            
            catch {
                
                print(error.localizedDescription)
            }
            
        }
        
        
        
        
        //4. Resume Task
        task.resume()

        
        
        
        
        
        
        
    }
    //5. Define Response Parameters in a Structure
    
    
    struct APIResponse : Codable {
        
        let USD : Float
        
    }
    
    
    
    
}

