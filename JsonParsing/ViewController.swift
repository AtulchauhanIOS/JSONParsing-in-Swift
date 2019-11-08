//
//  ViewController.swift
//  JsonParsing
//
//  Created by Sharad Kumar on 11/8/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        jsonParsing()
        
        
    }
    func jsonParsing(){
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/todos") else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do {
                //here dataResponse received from a network request
                let decoder = JSONDecoder()
                let model = try decoder.decode([User].self, from:
                    dataResponse) //Decode JSON Response Data
                print(model[0])
                print("userId:",model[0].userId)
                print("ID:",model[0].id)
                print("COMPLETED:",model[0].completed)
                print("TITLE:",model[0].title)
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
}

