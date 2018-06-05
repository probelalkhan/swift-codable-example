//
//  ViewController.swift
//  SwiftJSONExample
//
//  Created by Belal Khan on 05/06/18.
//  Copyright © 2018 Belal Khan. All rights reserved.
//

import UIKit
import Alamofire

struct Hero : Codable{
    let name:String?
    let realname: String?
    let team: String?
    let firstappearance: String?
    let createdby: String?
    let publisher: String?
    let imageurl: String?
    let bio: String?
}

class ViewController: UIViewController {
    
    var heroes = [Hero]()
    
    //defining the API URL
    let API_URL = "https://www.simplifiedcoding.net/demos/marvel/"

    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(API_URL).responseJSON { response in
            let json = response.data
            
            do{
                //created the json decoder
                let decoder = JSONDecoder()
                
                //using the array to put values
                self.heroes = try decoder.decode([Hero].self, from: json!)
                
                //printing all the hero names
                for hero in self.heroes{
                    print(hero.name!)
                }
                
            }catch let err{
                print(err)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

