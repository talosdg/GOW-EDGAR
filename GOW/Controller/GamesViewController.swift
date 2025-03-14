//
//  GamesViewController.swift
//  GOW
//
//  Created by Rafael Gonzalez on 07/03/25.
//

import UIKit

class GamesViewController: UIViewController {
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var imagePageControl: UIPageControl!
    
    var currentPage = 0
    
    @IBAction func leftSwipeDone(_ sender: Any) {
        print("< izquierda")
        imagePageControl.setIndicatorImage(UIImage(named: "gow_dot"), forPage: imagePageControl.currentPage )
        if imagePageControl.currentPage == 7{
            imagePageControl.currentPage = 0
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
        }else{
            imagePageControl.currentPage += 1
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
        }
        imagePageControl.setIndicatorImage(UIImage(named: "gow_logo"), forPage: imagePageControl.currentPage )
    }
    @IBAction func rightSwipeDone(_ sender: Any) {
        print("derecha >")
        imagePageControl.setIndicatorImage(UIImage(named: "gow_dot"), forPage: imagePageControl.currentPage )
        if imagePageControl.currentPage == 0{
            imagePageControl.currentPage = 7
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
           
        }else{
            imagePageControl.currentPage -= 1
            gameImage.image = UIImage(named: String(gamePosters[imagePageControl.currentPage]))
        }
        imagePageControl.setIndicatorImage(UIImage(named: "gow_logo"), forPage: imagePageControl.currentPage )

    }
    
    //datasource :P
    let gamePosters = Array(0...7)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imagePageControl.numberOfPages = gamePosters.count
        gameImage.image = UIImage(named: gamePosters.first?.description ?? "0")

        imagePageControl.preferredIndicatorImage = UIImage(named: "gow_dot")
        imagePageControl.setIndicatorImage(UIImage(named: "gow_logo"), forPage: 0)
        
        
    }
   
}
