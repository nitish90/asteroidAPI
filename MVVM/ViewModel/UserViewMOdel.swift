//
//  UserViewMOdel.swift
//  MVVM
//
//  Created by Nitish on 26/09/21.
//

import UIKit

class userViewModel {
    
    var vc: ViewController?
    var userArr = [userModel]()
    
    func getUserData()  {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos")!){data,response,error in
            if error == nil {
                if let data = data {
                do {
                    let userResposne = try JSONDecoder().decode([userModel].self, from: data)
                    self.userArr.append(contentsOf: userResposne)
                    //print("userResponse \(self.userArr[1].title)")
                } catch let err   {
                    print("error \(err)")
                }
                }}else{
                print("error \(error?.localizedDescription)")
                }
        }.resume()
}
}
