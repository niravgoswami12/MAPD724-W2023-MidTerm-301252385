//
//  GameViewController.swift
//  MAPD724-W2023-MidTerm-301252385
//
//  Created by Nirav Goswami on 2023-02-28.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    // Instance Variables
    var currentScene: GKScene?
    
    @IBOutlet weak var LivesLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var StartLabel: UILabel!
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var EndLabel: UILabel!
    @IBOutlet weak var RestartButton: UIButton!
    
    var isGameStarted = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        presentStartScene()
        
        CollisionManager.gameViewController = self
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        if(UIDevice.current.orientation.isLandscape) {
            // landscape mode
            if(isGameStarted){
                setScene(sceneName: "GameLandscapeScene")
            }
      
        } else if(UIDevice.current.orientation.isPortrait) {
            // portrait mode
            if(isGameStarted){
                setScene(sceneName: "GamePortraitScene")
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask
    {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateLivesLabel()
    {
        LivesLabel.text = "Lives: \(ScoreManager.Lives)"
    }
    
    func updateScoreLabel()
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func setScene(sceneName: String) -> Void
    {
        currentScene = GKScene(fileNamed: sceneName)
        
        if let scene = currentScene!.rootNode as! SKScene?
        {
            scene.scaleMode = .aspectFill
            if let view = self.view as! SKView?
            {
                view.presentScene(scene)
                view.ignoresSiblingOrder = true
            }
        }
    }
    
    func presentStartScene()
    {
        isGameStarted = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        StartLabel.isHidden = false
        StartButton.isHidden = false
        setScene(sceneName: "StartScene")
    }
    
    func presentEndScene()
    {
        isGameStarted = false
        ScoreLabel.isHidden = true
        LivesLabel.isHidden = true
        RestartButton.isHidden = false
        EndLabel.isHidden = false
        setScene(sceneName: "EndScene")
    }
    
    @IBAction func StartButton_Pressed(_ sender: UIButton)
    {
        isGameStarted = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        StartLabel.isHidden = true
        StartButton.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        if(UIDevice.current.orientation.isLandscape) {
            setScene(sceneName: "GameLandscapeScene")
        } else if(UIDevice.current.orientation.isPortrait) {
            setScene(sceneName: "GamePortraitScene")
        }
    }
    
    @IBAction func RestartButton_Pressed(_ sender: UIButton)
    {
        isGameStarted = true
        ScoreLabel.isHidden = false
        LivesLabel.isHidden = false
        RestartButton.isHidden = true
        EndLabel.isHidden = true
        // Initialize the Lives and Score
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
        if(UIDevice.current.orientation.isLandscape) {
            setScene(sceneName: "GameLandscapeScene")
        } else if(UIDevice.current.orientation.isPortrait) {
            setScene(sceneName: "GamePortraitScene")
        }
        
    }
    
    
}
