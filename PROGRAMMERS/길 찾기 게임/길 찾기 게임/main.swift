//
//  main.swift
//  길 찾기 게임
//
//  Created by 유현진 on 2023/10/10.
//

import Foundation

class Node{
    var v: Int
    var x: Int
    var left: Node?
    var right: Node?
    
    init(x: Int, v: Int, left: Node? = nil, right: Node? = nil) {
        self.v = v
        self.x = x
        self.left = left
        self.right = right
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    
    var stack = [[Int]]()
    let temp = nodeinfo.enumerated().map{[$0.element[0],$0.element[1],$0.offset + 1]}
    let nodes = temp.sorted{$0[1] == $1[1] ? $0[0] < $1[0] : $0[1] > $1[1]}
    
    var root: Node?
    var pre = [Int]()
    var post = [Int]()
    func newNode(newNode: Node){
        root = insertNode(node: root, newNode: newNode)
    }
    
    func insertNode(node: Node?, newNode: Node) -> Node{
        guard let node = node else{
            return newNode
        }
        
        if node.x < newNode.x{
            node.right = insertNode(node: node.right, newNode: newNode)
        }else{
            node.left = insertNode(node: node.left, newNode: newNode)
        }
        
        return node
    }
    
    func preorder(node: Node?){
        guard let node = node else { return }
        pre.append(node.v)
        preorder(node: node.left)
        preorder(node: node.right)
    }
    
    func postorder(node: Node?){
        guard let node = node else { return }
        postorder(node: node.left)
        postorder(node: node.right)
        post.append(node.v)
        
    }
    for node in nodes {
        let x = node[0]
        let v = node[2]
    
        newNode(newNode: Node(x: x, v: v))
    }
    
    preorder(node: root)
    postorder(node: root)

    return [pre,post]
}

print(solution([[5,3],[11,5],[13,3],[3,5],[6,1],[1,3],[8,6],[7,2],[2,2]]))
