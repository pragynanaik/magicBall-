//
//  ViewController.swift
//  magicBall
//
//  Created by Pragyna Naik on 5/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var magicImage: UIImageView!
    
    @IBOutlet weak var prompt: UILabel!
    
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        answer.backgroundColor = UIColor.clear
        answer.layer.backgroundColor = UIColor.black.cgColor
        // Create URL
         let url = URL(string: "https://image.shutterstock.com/image-photo/black-magic-ball-no-8-600w-61880773.jpg")!

         DispatchQueue.global().async {
             // Fetch Image Data
             if let data = try? Data(contentsOf: url) {
                 DispatchQueue.main.async {
                     // Create Image and Update Image View
                     self.magicImage.image = UIImage(data: data)
                 }
             }
         }
        
        
        

    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        answer.layer.backgroundColor = UIColor.black.cgColor
        
        if motion == .motionShake {
            let answerArray = ["YES definately", "No!", "Hmm...Maybe?"]
            let number = Int.random(in: 0..<3)
            answer.text = answerArray[number]
            UIView.animate(withDuration: 2.0, animations: {
                   self.answer.layer.backgroundColor = UIColor.white.cgColor
               })
        }
    }


}

