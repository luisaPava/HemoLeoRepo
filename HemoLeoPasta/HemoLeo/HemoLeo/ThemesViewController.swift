//
//  ThemesViewController.swift
//  HemoLeo
//
//  Created by Karina F Tronkos on 7/22/16.
//  Copyright © 2016 Bepid. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //let themes = ["Normal", "Castelo", "Cidade" , "Espaco", "Neve", "Praia"]
    let themes: [UIImage] = [UIImage(named: "Default")!, UIImage(named: "Castelo")!, UIImage(named: "Cidade")!, UIImage(named: "Espaco")!, UIImage(named: "Neve")!, UIImage(named: "Praia")!]
    
    var index: Int!
    
    private var cellPos : CGPoint!
    private var image : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackground")!)
        collectionView.backgroundColor = UIColor.clearColor()

    }
    
    override func viewDidAppear(animated: Bool) {
        //collectionView.backgroundColor = UIColor.clearColor()
        //super.viewDidAppear(animated)
        if cellPos != nil{
            self.image.removeFromSuperview()
            cellPos = nil
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
       print("botao back dos temas pressed")
        let presentingViewController: UIViewController! = self.presentingViewController
        
        self.dismissViewControllerAnimated(false) {
            presentingViewController.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(themes.count)
        return self.themes.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! ThemesCollectionViewCell
        
        cell.imageView?.image = themes[indexPath.row]
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        index = indexPath.row
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ThemesCollectionViewCell
        image = UIImageView(image: cell.imageView.image)
        image.frame.size = cell.frame.size
        image.frame.origin = view.convertPoint(cell.frame.origin, fromView: collectionView)
        view.addSubview(image)
        cellPos = image.center
        
        //let fadeOut = UIAnimation.fadeOutWithDuration(0.2)
        let movement = UIAnimation.moveTo(CGPointMake(view.frame.width/2, view.frame.height/2), duration: 0.8)
        
        let doMovement = UIAnimation.runBlock {
            UIView.animateWithDuration(1, animations: {
                self.image.transform = CGAffineTransformScale(self.image.transform, 1.5, 1.5)
            })
            self.image.runAnimation(movement)
            
        }
        
        //let sequence = UIAnimation.sequence([fadeOut,doMovement])
        let sequence = UIAnimation.sequence([doMovement])
        
        //collectionView.runAnimation(sequence)
        
        collectionView.runAnimation(sequence, completion:  { finished in
            self.performSegueWithIdentifier("toSelectTheme", sender: self)
        })
        
        //self.performSegueWithIdentifier("toSelectTheme", sender: self)
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if (segue.identifier == "toSelectTheme") {
//            let vc = segue.destinationViewController as! SelectThemeViewController
//            //vc.imageToSend = image.image!
//            //vc.previousVC = self
//            vc.previousVC = MainViewController()
//        }
//    }
    
    
}

