//
//  ForestScene.swift
//  MetalRenderer
//
//  Created by Fedor Artemenkov on 17.01.2022.
//

import Foundation
import simd

class ForestScene: Scene
{
    override func build()
    {
//        guard let data = loadSceneData(from: "forest") else { return }
//        
//        for node in data.gameObjects
//        {
//            let mesh = Mesh(modelName: node.mesh)
//
//            let gameObject = GameObject(name: node.name, mesh: mesh)
//
//            gameObject.transform.position = node.transform.position
//            gameObject.transform.rotation = node.transform.rotation
//            gameObject.transform.scale = node.transform.scale
//
//            addChild(gameObject)
//        }


        let pines: [Mesh] = [
            Mesh(modelName: "tree_pineTallA_detailed"),
            Mesh(modelName: "tree_pineDefaultB"),
            Mesh(modelName: "tree_pineRoundC")
        ]

        for i in 0..<100
        {
            guard let mesh = pines.randomElement() else { continue }

            let tree = GameObject(name: "Tree_\(i)", mesh: mesh)

            let radius: Float = Float.random(in: 8...70)
            let x = cos(Float(i)) * radius
            let z = sin(Float(i)) * radius

            let scale = Float.random(in: 1...2)

            tree.transform.position = float3(x, 0, z)
            tree.transform.scale = float3(repeating: scale)
            tree.transform.rotation.yaw = Float.random(in: 0...360).radians

            addChild(tree)
        }


        let flowers: [Mesh] = [
            Mesh(modelName: "flower_purpleA"),
            Mesh(modelName: "flower_redA"),
            Mesh(modelName: "flower_yellowA")
        ]

        for i in 0..<100
        {
            guard let mesh = flowers.randomElement() else { continue }

            let flower = GameObject(name: "Flower_\(i)", mesh: mesh)

            let radius: Float = Float.random(in: 1...10)
            let x = cos(Float(i)) * radius
            let z = sin(Float(i)) * radius

            flower.transform.position = float3(x, 0, z)
            flower.transform.rotation.yaw = Float.random(in: 0...360).radians

            addChild(flower)
        }
        
        let light = LightNode()
        light.transform.position = float3(0, 0.2, 0)
        light.setLight(color: float3(1.0, 0.9, 0.7))
        light.setLight(brightness: 5)
        lights.append(light)
        addChild(light)
    }
    
    override func doUpdate()
    {
    }
}

//extension ForestScene
//{
//    struct SceneData: Decodable
//    {
//        let playerPosition: float3
//        let gameObjects: [GameObjectData]
//    }
//
//    struct GameObjectData: Decodable
//    {
//        let name: String
//        let transform: Transform
//        let mesh: String
//    }
//
//    struct Transform: Decodable
//    {
//        let position: float3
//        let rotation: Rotator
//        let scale: float3
//    }
//
//    func loadSceneData(from fileName: String) -> SceneData?
//    {
//        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return nil }
//
//        do
//        {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let jsonData = try decoder.decode(SceneData.self, from: data)
//            return jsonData
//        }
//        catch
//        {
//            print("error:\(error)")
//        }
//
//        return nil
//    }
//}
