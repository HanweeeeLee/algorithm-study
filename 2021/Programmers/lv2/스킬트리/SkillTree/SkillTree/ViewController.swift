//
//  ViewController.swift
//  SkillTree
//
//  Created by hanwe on 2021/07/13.
//

import Cocoa

class ViewController: NSViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))") // 2
    }
    
    func solution(_ skill:String, _ skill_trees:[String]) -> Int {
        var rightTreeCnt: Int = 0
        
        for i in 0..<skill_trees.count {
            let checkItem = skill_trees[i]
            if checkRightSkillTree(skillTree: skill, checked: checkItem) {
                rightTreeCnt += 1
            }
        }
        
        return rightTreeCnt
    }
    
    func checkRightSkillTree(skillTree: String, checked: String) -> Bool {
        var isRight: Bool = true
        
        var skillTreeArr = Array(skillTree)
        let checkedArr = Array(checked)
        
        for checkedItem in checkedArr {
            if skillTreeArr.count == 0 {
                break
            }
            if skillTreeArr.contains(checkedItem) {
                if skillTreeArr.first! != checkedItem {
                    isRight = false
                    break
                } else {
                    skillTreeArr.removeFirst()
                }
            } else {
                continue
            }
        }
        return isRight
    }


}

