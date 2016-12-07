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
    var tail: SKSpriteNode!
    var lionMovingFrames: [SKTexture]!
    var tailMovingFrames: [SKTexture]!
    var lionCuddlingFrames: [SKTexture]!
    let defaults = UserDefaults.standard
    var bgImage: SKSpriteNode!
    
    var careCardModel = CareCardModel.sharedCareCardModel
    
    var leo: String!
    var leoName: String!
    var tailName: String!
    var carinhoName: String!
    
    var timer1 = Timer()
    var timer2 = Timer()
    
    override func didMove(to view: SKView) {
        /* Setup your scene here */
//        backgroundColor = UIColor.clearColor()
        
        leo = careCardModel.getLeo().getImage()
        getLeoName()
        
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
        
        var tailFrames = [SKTexture]()
        
        //let numImages = lionAnimatedAtlas.textureNames.count
        for i in 1..<21 {
            let lionTextureName = "\(leoName!)\(i)"
            lionFrames.append(lionAnimatedAtlas.textureNamed(lionTextureName))
        }
        var i = 20;
        while (i > 0) {
            let lionTextureName = "\(leoName!)\(i)"
            lionFrames.append(lionAnimatedAtlas.textureNamed(lionTextureName))
            i -= 1;
        }
        
        for i in 1..<20 {
            let tailTextureName = "\(tailName!)\(i)"
            tailFrames.append(lionAnimatedAtlas.textureNamed(tailTextureName))
        }
        i = 19;
        while (i > 0) {
            let tailTextureName = "\(tailName!)\(i)"
            tailFrames.append(lionAnimatedAtlas.textureNamed(tailTextureName))
            i -= 1;
        }
        lionMovingFrames = lionFrames
        
        let firstFrame = lionMovingFrames[0]
        lion = SKSpriteNode(texture: firstFrame)
        lion.name = "lionLeo"
        lion.size = CGSize(width: 400, height: 400)
        lion.isUserInteractionEnabled = false
        lion.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
        lion.zPosition = 5
        addChild(lion)
        
        tailMovingFrames = tailFrames
        
        let secondFrame = tailMovingFrames[0]
        tail = SKSpriteNode(texture: secondFrame)
        tail.name = "tail"
        tail.size = CGSize(width: 140, height: 152.5)
        tail.position = CGPoint(x: 418, y: 215)
        tail.zPosition = 1
        addChild(tail)
        
        //moveLionLeo()
        
        timer1 = Timer.scheduledTimer(timeInterval: 2.8, target: self, selector: #selector(GameScene.moveLionLeo), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 3.1, target: self, selector: #selector(GameScene.moveTail), userInfo: nil, repeats: true)
        
        timer1.fire()
        timer2.fire()
    }
    
    func getLeoName() {
        switch leo {
            case "LeoOficial":
                print("Ola")
                leoName = "Leo"
                tailName = "Tail"
                carinhoName = "carinho"
            
            case "LeoB Oficial":
                print("Ola2")
                leoName = "LeoB"
                tailName = "TailB"
                carinhoName = "carinhoB"
            
            case "LeoM Oficial":
                print("Ola3")
                leoName = "LeoM"
                tailName = "TailM"
                carinhoName = "carinhoM"
            
            default:
                break
        }
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
                timePerFrame: 0.02,
                resize: false,
                restore: true), count: 1),
                       withKey:"LionMovingInScreen")
    }
    
    func moveTail() {
        tail.run(SKAction.repeat(SKAction.animate(with: tailMovingFrames,
                                                  timePerFrame: 0.05,
                                                  resize: false,
                                                  restore: true), count: 1))
    }
    
    func cuddleLeo() {
        //lion.isHidden = true
        lion.removeFromParent()
        
        lion2.run(SKAction.repeat(SKAction.animate(with: lionCuddlingFrames,
                                                   timePerFrame: 0.03,
                                                   resize: false,
                                                   restore: true), count: 1), completion: {
                                                    print("Petting ended")
                                                    //lion.isHidden = false
                                                    //lion2.isHidden = true
                                                    self.lion2.removeFromParent()
                                                    self.addChild(self.lion)
                                                    
        })
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
                    let lionTextureName = "\(carinhoName!)\(i)"
                    lionFrames2.append(lionAnimatedAtlas.textureNamed(lionTextureName))
                }
                var i = 19;
                while (i > 0) {
                    let lionTextureName = "\(carinhoName!)\(i)"
                    lionFrames2.append(lionAnimatedAtlas.textureNamed(lionTextureName))
                    i -= 1;
                }
                lionCuddlingFrames = lionFrames2
                
                let firstFrame = lionCuddlingFrames[0]
                lion2 = SKSpriteNode(texture: firstFrame)
                lion2.position = CGPoint(x: self.size.width/2, y: self.size.height/3)
                lion2.size = CGSize(width: 400, height: 400)
                lion2.zPosition = 5
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
