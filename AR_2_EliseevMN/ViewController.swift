//
//  ViewController.swift
//  AR_2_EliseevMN
//
//  Created by Максим on 16.09.2018.
//  Copyright © 2018 MaksimEliseev. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        loadHouse()
        loadHouseProgramm()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    func loadHouse() {
        let scene = SCNScene(named: "art.scnassets/House.scn")!
        sceneView.scene = scene
    }
    
    func loadHouseProgramm() {
        let node = SCNNode()
        node.position = SCNVector3(0, 0, 0)
        node.scale = SCNVector3(0.05, 0.05, 0.05)
        sceneView.scene.rootNode.addChildNode(node)
        
        // Дом
        let nodeHouse = SCNNode()
        nodeHouse.position = SCNVector3(0,0.5,0)
        let boxHouse = SCNBox(width: 0.5, height: 1, length: 3, chamferRadius: 0)
        let colorHouse = UIImage(named: "art.scnassets/house.jpg")
        boxHouse.firstMaterial?.diffuse.contents = colorHouse
        nodeHouse.geometry = boxHouse
        
        // Трава
        let grassNode = SCNNode()
        grassNode.position = SCNVector3(0,0,0)
        let grassHouse = SCNBox(width: 4, height: 0.01, length: 4, chamferRadius: 0)
        let colorGrass = UIImage(named: "art.scnassets/trava.jpg")
        grassHouse.firstMaterial?.diffuse.contents = colorGrass
        grassNode.geometry = grassHouse
        
        
        for item in 1...4 {
            for index in 1...2 {
                // Ствол дерева
                let treeNode = SCNNode()
                treeNode.position = SCNVector3(-2.7 + Double(index), 0.2, (-2.5 + Double(item)))
                let treeTrunk = SCNCylinder(radius: 0.01, height: 0.4)
                let colorTrunk = UIImage(named: "art.scnassets/stvol.jpg")
                treeTrunk.firstMaterial?.diffuse.contents = colorTrunk
                treeNode.geometry = treeTrunk
                //Листва дерева
                let leafNode = SCNNode()
                leafNode.position = SCNVector3(-2.7 + Double(index), 0.4, (-2.5 + Double(item)))
                let leafTree = SCNSphere(radius: 0.2)
                let colorLeaf = UIImage(named: "art.scnassets/tree.jpg")
                leafTree.firstMaterial?.diffuse.contents = colorLeaf
                leafNode.geometry = leafTree
                
                node.addChildNode(treeNode)
                node.addChildNode(leafNode)
            }
        }
        
        for item in 1...4 {
            for index in 1...2 {
                // Ствол дерева
                let treeNode = SCNNode()
                treeNode.position = SCNVector3(-0.4 + Double(index), 0.2, (-2.5 + Double(item)))
                let treeTrunk = SCNCylinder(radius: 0.01, height: 0.4)
                let colorTrunk = UIImage(named: "art.scnassets/stvol.jpg")
                treeTrunk.firstMaterial?.diffuse.contents = colorTrunk
                treeNode.geometry = treeTrunk
                //Листва дерева
                let leafNode = SCNNode()
                leafNode.position = SCNVector3(-0.4 + Double(index), 0.4, (-2.5 + Double(item)))
                let leafTree = SCNSphere(radius: 0.2)
                let colorLeaf = UIImage(named: "art.scnassets/tree.jpg")
                leafTree.firstMaterial?.diffuse.contents = colorLeaf
                leafNode.geometry = leafTree
                
                node.addChildNode(treeNode)
                node.addChildNode(leafNode)
            }
        }

        node.addChildNode(grassNode)
        node.addChildNode(nodeHouse)
 
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
