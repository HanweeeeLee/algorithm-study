//
//  ViewController.swift
//  20210313_Programmers_lv1
//
//  Created by hanwe on 2021/03/13.
// https://programmers.co.kr/learn/courses/30/lessons/12930

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("result:\(solution("try hello world"))")
        print("result2:\(solution("Hello eVeryone"))")//"HeLlO EvErYoNe"
    }
    
    func solution(_ s:String) -> String {
        var wordArr = s.split(separator:" ")
        for i in 0..<wordArr.count {
            var newWordArr = Array(wordArr[i])
            for j in 0..<newWordArr.count {
                if j%2 == 0 {
                    newWordArr[j] = Substring.Element(String(newWordArr[j]).uppercased())
                }
                else {
                    newWordArr[j] = Substring.Element(String(newWordArr[j]).lowercased())
                }
            }
            wordArr[i] = String.SubSequence(newWordArr)
        }
        return wordArr.joined(separator:" ")
    }

}

