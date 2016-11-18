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
    var lionCuddlingFrames: [SKTexture]!
    let defaults = UserDefaults.standard
    var bgImage: SKSpriteNode!
    
    var mytimer = Timer()
    
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
        for i in 1..<21 {
            let lionTextureName = "Leo\(i)"
            lionFrames.append(lionAnimatedAtlas.textureNamed(lionTextureName))
        }
        var i = 20;
        while (i > 0) {
            let lionTextureName = "Leo\(i)"
            lionFrames.append(lionAnimatedAtlas.textureNamed(lionTextureName))
            i -= 1;
        }
        lionMovingFrames = lionFrames
        
        let firstFrame = lionMovingFrames[0]
        lion = SKSpriteNode(texture: firstFrame)
        lion.name = "lionLeo"
        lion.size = CGSize(width: 400, height: 400)
        lion.isUserInteractionEnabled = false
        lion.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        lion.zPosition = 1
        addChild(lion)
        
        //moveLionLeo()
        
        mytimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(GameScene.moveLionLeo), userInfo: nil, repeats: true)
        
        mytimer.fire()
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
        lion.run(SKAction.repeat(
            SKAction.animate(with: lionMovingFrames,
                timePerFrame: 0.12,
                resize: false,
                restore: true), count: 1),
                       withKey:"LionMovingInScreen")
    }
    
    func cuddleLeo() {
        lion.isHidden = true
        
        lion2.run(SKAction.repeat(SKAction.animate(with: lionCuddlingFrames,
            timePerFrame: 0.03,
            resize: false,
            restore: true), count: 1)) {
                print("Petting ended")
                self.lion.isHidden = false
                self.lion2.isHidden = true
                
                //sleep(2)
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
                var lionFrames2 = [SKTexture]()
                
                for i in 1..<20 {
                    let lionTextureName = "carinho\(i)"
                    lionFrames2.append(lionAnimatedAtlas.textureNamed(lionTextureName))
                }
                var i = 19;
                while (i > 0) {
                    let lionTextureName = "carinho\(i)"
                    lionFrames2.append(lionAnimatedAtlas.textureNamed(lionTextureName))
                    i -= 1;
                }
                lionCuddlingFrames = lionFrames2
                
                let firstFrame = lionCuddlingFrames[0]
                lion2 = SKSpriteNode(texture: firstFrame)
                lion2.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
                lion2.size = CGSize(width: 400, height: 400)
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
