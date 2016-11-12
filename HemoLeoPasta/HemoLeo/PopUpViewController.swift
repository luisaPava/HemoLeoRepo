//
//  PopUpController.swift
//  HemoLeo
//
//  Created by Gabriel Oliveira on 11/11/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, PopupContentViewController {
    var popupSize: CGSize!
    var closeHandler: (() -> Void)?
    static var sliderValue = 0
    @IBOutlet weak var slider: G8SliderStep?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupSize = CGSize(width: 300, height: 300)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.view.layer.cornerRadius = 10
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    //Returns PopUpViewController
    class func instance() -> PopUpViewController {
        let storyboard = UIStoryboard(name: "PopUp", bundle: nil)
        return storyboard.instantiateInitialViewController() as! PopUpViewController
    }
    
    //Set PopUp size
    func sizeForPopup(_ popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        return popupSize
    }
    
    // Set the images of the slider
    func setSliderImages() {
        for i in 0...10 {
            if i <= 5 {
                // Colocar imagem de 1 a 5 (carinha feliz)
//                slider?.stepImages?.append(<#T##newElement: Element##Element#>)
                
            } else {
                // Colocar imagem de 6 a 10 (carinha triste)
//                slider?.stepImages?.append(<#T##newElement: Element##Element#>)
            }
        }
    }
    
    @IBAction func sliderChanged(_ sender: G8SliderStep) {
        PopUpViewController.sliderValue = Int(sender.value)
    }
    
    //Dismiss method
    @IBAction func exitButton(_ sender: AnyObject) {
        closeHandler!()
        
    }
}

