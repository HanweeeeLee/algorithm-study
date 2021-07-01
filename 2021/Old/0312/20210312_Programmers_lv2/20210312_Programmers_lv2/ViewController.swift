//
//  ViewController.swift
//  20210312_Programmers_lv2
//
//  Created by hanwe on 2021/03/12.
//https://programmers.co.kr/learn/courses/30/lessons/42578

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("result:\(solution([["yellowhat", "headgear"], ["bluesunglasses", "eyewear"], ["green_turban", "headgear"]]))") //5
        
        print("result:\(solution([["crowmask", "face"], ["bluesunglasses", "face"], ["smoky_makeup", "face"]]))") //3
    }
    func solution(_ clothes:[[String]]) -> Int {
        var totalCase: Int = 1
        var allItems: [String : [String]] = [String : [String]]()
        for i in 0..<clothes.count { // 아이템 정리하기
            if allItems[clothes[i][1]] == nil {
                allItems[clothes[i][1]] = [String]()
            }
            allItems[clothes[i][1]]?.append(clothes[i][0])
        }
        
        let allKeys = Array(allItems.keys)
        for i in 0..<allKeys.count {
            totalCase = totalCase * (allItems[allKeys[i]]!.count + 1)
        }
        totalCase -= 1
        return totalCase
    }
}

