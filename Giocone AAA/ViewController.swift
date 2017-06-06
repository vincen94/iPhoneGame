//
//  ViewController.swift
//  Giocone AAA
//
//  Created by Luca Chianese on 05/06/17.
//  Copyright © 2017 Luca Chianese. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController, SKPhysicsContactDelegate {

    @IBOutlet var skview: SKView!
    @IBOutlet var jumpbutton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!

    var lose = false
    var scene = SKScene()
    var ball = SKShapeNode(circleOfRadius: 30)
    var gameOverLabel = SKLabelNode(text: "GAME OVER")
    var score = 0
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name != "scena" && contact.bodyB.node?.name != "scena" && !lose {
            jumpbutton.isEnabled = false
            ball.physicsBody?.restitution = CGFloat(0)
            ball.physicsBody?.affectedByGravity = false
            scene.addChild(gameOverLabel)
            lose = true
            ball.run(SKAction.move(to: CGPoint(x: scene.frame.midX, y: scene.frame.midY), duration: TimeInterval(1)))
            ball.run(SKAction.scale(to: CGFloat(0), duration: TimeInterval(1)), completion: {
                self.jumpbutton.setTitle("RESTART", for: .normal)
                self.jumpbutton.isEnabled = true
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scene.size = skview.frame.size
        scene.name = "scena"
        scene.physicsWorld.speed = 0.5
        scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.frame)
        scene.physicsWorld.contactDelegate = self
        skview.presentScene(scene)
        
        gameOverLabel.fontSize = 50
        gameOverLabel.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
        
        ball.fillColor = .red
        ball.strokeColor = .white
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        ball.physicsBody?.affectedByGravity = false
        ball.physicsBody?.contactTestBitMask = 1
        ball.physicsBody?.restitution = 1
        ball.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
        scene.addChild(ball)
        
        //spuntoni
        let triangleWidth = Float(scene.frame.width / 5)
        
        let pointsBottom = [CGPoint(x: 0, y: 0), CGPoint(x: Int(triangleWidth/2), y: 100), CGPoint(x: Int(triangleWidth), y: 0)]
        let triangleBottomPath = CGMutablePath()
        triangleBottomPath.addLines(between: pointsBottom)
        
        let pointsUP = [CGPoint(x: 0, y: 100), CGPoint(x: Int(triangleWidth/2), y: 0), CGPoint(x: Int(triangleWidth), y: 100)]
        let triangleUPPath = CGMutablePath()
        triangleUPPath.addLines(between: pointsUP)
        
        let triangle1Bottom = SKShapeNode(path: triangleBottomPath)
        triangle1Bottom.position = CGPoint(x: CGFloat(0), y: CGFloat(0))
        triangle1Bottom.fillColor = .white
        triangle1Bottom.strokeColor = .gray
        triangle1Bottom.physicsBody = SKPhysicsBody(polygonFrom: triangleBottomPath)
        triangle1Bottom.physicsBody?.isDynamic = false
        
        let triangle2Bottom = SKShapeNode(path: triangleBottomPath)
        triangle2Bottom.position = CGPoint(x: CGFloat(triangleWidth), y: CGFloat(0))
        triangle2Bottom.fillColor = .white
        triangle2Bottom.strokeColor = .gray
        triangle2Bottom.physicsBody = SKPhysicsBody(polygonFrom: triangleBottomPath)
        triangle2Bottom.physicsBody?.isDynamic = false
        
        let triangle3Bottom = SKShapeNode(path: triangleBottomPath)
        triangle3Bottom.position = CGPoint(x: CGFloat(triangleWidth * 2), y: CGFloat(0))
        triangle3Bottom.fillColor = .white
        triangle3Bottom.strokeColor = .gray
        triangle3Bottom.physicsBody = SKPhysicsBody(polygonFrom: triangleBottomPath)
        triangle3Bottom.physicsBody?.isDynamic = false
        
        let triangle4Bottom = SKShapeNode(path: triangleBottomPath)
        triangle4Bottom.position = CGPoint(x: CGFloat(triangleWidth * 3), y: CGFloat(0))
        triangle4Bottom.fillColor = .white
        triangle4Bottom.strokeColor = .gray
        triangle4Bottom.physicsBody = SKPhysicsBody(polygonFrom: triangleBottomPath)
        triangle4Bottom.physicsBody?.isDynamic = false
        
        let triangle5Bottom = SKShapeNode(path: triangleBottomPath)
        triangle5Bottom.position = CGPoint(x: CGFloat(triangleWidth * 4), y: CGFloat(0))
        triangle5Bottom.fillColor = .white
        triangle5Bottom.strokeColor = .gray
        triangle5Bottom.physicsBody = SKPhysicsBody(polygonFrom: triangleBottomPath)
        triangle5Bottom.physicsBody?.isDynamic = false
        
        let triangle1UP = SKShapeNode(path: triangleUPPath)
        triangle1UP.position = CGPoint(x: CGFloat(0), y: CGFloat(scene.frame.height - 100))
        triangle1UP.fillColor = .white
        triangle1UP.strokeColor = .gray
        triangle1UP.physicsBody = SKPhysicsBody(polygonFrom: triangleUPPath)
        triangle1UP.physicsBody?.isDynamic = false

        let triangle2UP = SKShapeNode(path: triangleUPPath)
        triangle2UP.position = CGPoint(x: CGFloat(triangleWidth), y: CGFloat(scene.frame.height - 100))
        triangle2UP.fillColor = .white
        triangle2UP.strokeColor = .gray
        triangle2UP.physicsBody = SKPhysicsBody(polygonFrom: triangleUPPath)
        triangle2UP.physicsBody?.isDynamic = false
        
        let triangle3UP = SKShapeNode(path: triangleUPPath)
        triangle3UP.position = CGPoint(x: CGFloat(triangleWidth * 2), y: CGFloat(scene.frame.height - 100))
        triangle3UP.fillColor = .white
        triangle3UP.strokeColor = .gray
        triangle3UP.physicsBody = SKPhysicsBody(polygonFrom: triangleUPPath)
        triangle3UP.physicsBody?.isDynamic = false
        
        let triangle4UP = SKShapeNode(path: triangleUPPath)
        triangle4UP.position = CGPoint(x: CGFloat(triangleWidth * 3), y: CGFloat(scene.frame.height - 100))
        triangle4UP.fillColor = .white
        triangle4UP.strokeColor = .gray
        triangle4UP.physicsBody = SKPhysicsBody(polygonFrom: triangleUPPath)
        triangle4UP.physicsBody?.isDynamic = false
        
        let triangle5UP = SKShapeNode(path: triangleUPPath)
        triangle5UP.position = CGPoint(x: CGFloat(triangleWidth * 4), y: CGFloat(scene.frame.height - 100))
        triangle5UP.fillColor = .white
        triangle5UP.strokeColor = .gray
        triangle5UP.physicsBody = SKPhysicsBody(polygonFrom: triangleUPPath)
        triangle5UP.physicsBody?.isDynamic = false
        
        scene.addChild(triangle1Bottom)
        scene.addChild(triangle2Bottom)
        scene.addChild(triangle3Bottom)
        scene.addChild(triangle4Bottom)
        scene.addChild(triangle5Bottom)
        scene.addChild(triangle1UP)
        scene.addChild(triangle2UP)
        scene.addChild(triangle3UP)
        scene.addChild(triangle4UP)
        scene.addChild(triangle5UP)
    }
    
    @IBAction func jump() {
        if !lose {
            var impulse = 70
            if ball.physicsBody?.affectedByGravity == false {
                ball.physicsBody?.affectedByGravity = true
            }
            ball.physicsBody?.applyImpulse(CGVector(dx: CGFloat(arc4random_uniform(100)) - 50, dy: CGFloat(impulse)))
            if(impulse > 5) {
                impulse -= 1
            }
            scene.speed += CGFloat(0.005)
            ball.physicsBody?.restitution += CGFloat(0.0001)
            score += 1
            scoreLabel.text = "SCORE: " + String(score)
        }
        else {
            lose = false
            score = 0
            scoreLabel.text = "SCORE: 0"
            gameOverLabel.removeFromParent()
            scene.speed = 0.5
            ball.removeFromParent()
            ball.setScale(CGFloat(1))
            ball.physicsBody?.restitution = 1
            ball.position = CGPoint(x: scene.frame.midX, y: scene.frame.midY)
            scene.addChild(ball)
            jumpbutton.setTitle("JUMP", for: .normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

