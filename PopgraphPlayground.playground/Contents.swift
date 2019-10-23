import Cocoa
import SceneKit
import SpriteKit
import PlaygroundSupport

let scene = SCNScene()

let gravityNode = SCNNode()
let radialGravityField = SCNPhysicsField.radialGravity()
gravityNode.physicsField = radialGravityField
gravityNode.position = SCNVector3Make(0, 10, 0)
radialGravityField.strength = 9.8

// comment out the next line to disable the radial gravity field
scene.rootNode.addChildNode(gravityNode)
// uncomment the next line to disable default gravity
scene.physicsWorld.gravity = SCNVector3Make(0, 0, 0)

let boxGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
boxGeometry.firstMaterial?.diffuse.contents = NSColor.red
let shape = SCNPhysicsShape(geometry: boxGeometry, options: nil)

let boxNode1 = SCNNode(geometry: boxGeometry)
boxNode1.position = SCNVector3Make(0, 6, 0)
scene.rootNode.addChildNode(boxNode1)
let body1 = SCNPhysicsBody(type: .dynamic, shape: shape)
boxNode1.physicsBody = body1

let boxNode2 = SCNNode(geometry: boxGeometry)
boxNode2.position = SCNVector3Make(0, 14, 0)
scene.rootNode.addChildNode(boxNode2)
let body2 = SCNPhysicsBody(type: .dynamic, shape: shape)
boxNode2.physicsBody = body2

let pyramidNode = SCNNode(geometry: SCNPyramid(width: 1, height: 1, length: 1))
pyramidNode.position = SCNVector3Make(2, 10, -2)
pyramidNode.physicsBody = SCNPhysicsBody(type: .dynamic, shape: SCNPhysicsShape(geometry: pyramidNode.geometry!))
scene.rootNode.addChildNode(pyramidNode)

// put something down at ground level to trick the automatic camera
let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.2))
sphereNode.position = SCNVector3Make(0, -1, 0)
scene.rootNode.addChildNode(sphereNode)

let floor = SCNFloor()
let floorNode = SCNNode(geometry: floor)
floorNode.physicsBody = SCNPhysicsBody(type: .static, shape: SCNPhysicsShape(geometry: floor, options: nil))
scene.rootNode.addChildNode(floorNode)

let sceneView = SCNView(frame: CGRect(x: 0, y: 0, width: 1200, height: 1200))
sceneView.allowsCameraControl = true
sceneView.autoenablesDefaultLighting = true
sceneView.backgroundColor = SKColor.lightGray
sceneView.showsStatistics = true
sceneView.debugOptions = [.showPhysicsFields, .showPhysicsShapes]
PlaygroundPage.current.liveView = sceneView
sceneView.scene = scene

