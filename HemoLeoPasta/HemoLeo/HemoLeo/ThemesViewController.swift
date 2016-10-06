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
    
    let themesNames = ["Default", "Castelo", "Cidade" , "Espaco", "Neve", "Praia"]
    let themes: [UIImage] = [UIImage(named: "Default")!, UIImage(named: "Castelo")!, UIImage(named: "Cidade")!, UIImage(named: "Espaco")!, UIImage(named: "Neve")!, UIImage(named: "Praia")!]
    
    var index: Int!
    
    private var cellPos : CGPoint!
    private var image : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "greenBackground")!)
        collectionView.backgroundColor = UIColor.clear

    }
    
    override func viewDidAppear(_ animated: Bool) {
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
//        let presentingViewController: UIViewController! = self.presentingViewController
//        
//        self.dismissViewControllerAnimated(false) {
//            presentingViewController.dismissViewControllerAnimated(false, completion: nil)
//        }

    }
    
    @IBAction func back(sender: AnyObject) {
                dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(themes.count)
        return self.themes.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ThemesCollectionViewCell
        
        cell.imageView?.image = themes[indexPath.row]
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        index = indexPath.row
        let cell = collectionView.cellForItem(at: indexPath as IndexPath) as! ThemesCollectionViewCell
        image = UIImageView(image: cell.imageView.image)
        image.frame.size = cell.frame.size
        image.frame.origin = view.convert(cell.frame.origin, from: collectionView)
        view.addSubview(image)
        cellPos = image.center
        
        //let fadeOut = UIAnimation.fadeOutWithDuration(0.2)
//        let movement = UIAnimation.moveTo(point: CGPoint(x: view.frame.width/2, y: view.frame.height/2), duration: 0.8)
        
//        let doMovement = UIAnimation.runBlock {
//            UIView.animate(withDuration: 1, animations: {
//                self.image.transform = self.image.transform.scaledBy(x: 1.5, y: 1.5)
//            })
//            self.image.runAnimation(animation: movement)
//            
//        }
        
        //let sequence = UIAnimation.sequence([fadeOut,doMovement])
//        let sequence = UIAnimation.sequence(animations: [doMovement])
        
        //collectionView.runAnimation(sequence)
//        
//        collectionView.runAnimation(animation: sequence, completion:  { finished in
//            self.performSegue(withIdentifier: "toSelectTheme", sender: self)
//        })
        
        //self.performSegueWithIdentifier("toSelectTheme", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toSelectTheme") {
            let vc = segue.destination as! SelectThemeViewController
            vc.imageToSend = themesNames[index]
            //vc.previousVC = self
//            vc.previousVC = MainViewController()
        }
    }
    
    
}

