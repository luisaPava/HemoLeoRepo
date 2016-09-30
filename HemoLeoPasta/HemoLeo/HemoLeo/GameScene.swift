//
//  GameScene.swift
//  SpriteKitAnimationTest_iPad
//
//  Created by Karina F Tronkos on 7/15/16.
//  Copyright (c) 2016 Karina F Tronkos. All rights reserved.
//

import SpriteKit



class GameScene: SKScene {
    var lion: SKSpriteNode!
    var lion2: SKSpriteNode!
    var lionMovingFrames: [SKTexture]!
    let defaults = UserDefaults.standard
    var bgImage: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
//        backgroundColor = UIColor.clearColor()
        
        if let image = defaults.string(forKey: "background") {
            bgImage = SKSpriteNode(imageNamed: image)
            
        } else {
            bgImage = SKSpriteNode(imageNamed: "Default")
            
        }
        
        bgImage.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        bgImage.zPosition = -10
        addChild(bgImage)
        
        
        let lionAnimatedAtlas = SKTextureAtlas(named: "LeoImages")
        var lionFrames = [SKTexture]()
        
        //let numImages = lionAnimatedAtlas.textureNames.count
        for i in 1..<23 {
            let lionTextureName = "leo\(i)"
            lionFrames.append(lionAnimatedAtlas.textureNamed(lionTextureName))
        }
        lionMovingFrames = lionFrames
        
        let firstFrame = lionMovingFrames[0]
        lion = SKSpriteNode(texture: firstFrame)
        lion.name = "lionLeo"
        lion.isUserInteractionEnabled = false
        lion.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        lion.zPosition = 1
        //lion.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        addChild(lion)
        
        
        moveLionLeo()
    }
    
    override func willMove(from view: SKView) {
        if let image = defaults.string(forKey: "background") {
            bgImage = SKSpriteNode(imageNamed: image)
            
        } else {
            bgImage = SKSpriteNode(imageNamed: "Default")
            
        }
    }
    
    func moveLionLeo() {
        //This is our general runAction method to make our bear walk.
        lion.run(SKAction.repeatForever(
            SKAction.animate(with: lionMovingFrames,
                timePerFrame: 0.12,
                resize: false,
                restore: true)),
                       withKey:"LionMovingInScreen")
    }
    
    func cuddleLeo() {
        lion.isHidden = true
        
        lion2.run(SKAction.repeat(SKAction.animate(with: lionMovingFrames,
            timePerFrame: 0.15,
            resize: false,
            restore: true), count: 1)) {
                print("Petting ended")
                self.lion.isHidden = false
                self.lion2.isHidden = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
        
        if let name = touchedNode.name {
            if name == "lionLeo" {
                print("Lion was touched")
                
                //ele receber carinho
                
                let lionAnimatedAtlas = SKTextureAtlas(named: "LeoImages")
                var lionFrames = [SKTexture]()
                
                for i in 1..<8 {
                    let lionTextureName = "carinho\(i)"
                    lionFrames.append(lionAnimatedAtlas.textureNamed(lionTextureName))
                }
                lionMovingFrames = lionFrames
                
                let firstFrame = lionMovingFrames[0]
                lion2 = SKSpriteNode(texture: firstFrame)
                lion2.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
                lion2.zPosition = 1
                addChild(lion2)
                cuddleLeo()
            }
        }
    }
    
    
    override func update(_ currentTime: CFTimeInterval) {
        if defaults.bool(forKey: "badgeSmart") && !defaults.bool(forKey: "smartAlreadyShown") && defaults.bool(forKey: "isGameScene") {
            print("Badge Complete")
            defaults.set(true, forKey: "smartAlreadyShown")
        }
    }
    
}

extension GameScene: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
}
