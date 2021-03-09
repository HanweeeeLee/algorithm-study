//
//  ViewController.swift
//  20210309_Programmers_lv2
//
//  Created by hanwe on 2021/03/09.
//
//https://programmers.co.kr/learn/courses/30/lessons/72411

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("sample1: \(solution(["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"], [2,3,4]))")
        //["AC", "ACDE", "BCFG", "CDE"]
        print("sample2: \(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))")
        //["ACD", "AD", "ADE", "CD", "XYZ"]
        print("sample3: \(solution(["XYZ", "XWY", "WXA"], [2,3,4]))")
        //["WX", "XY"]
    }
    
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        var returnArr = [String]()
        for i in 0..<course.count {
            returnArr = returnArr + getCombination(selectedMenuArr: orders, wantMenuCnt: course[i])
        }
        
        return returnArr.sorted(by: { $0 < $1 })
    }
    
    func getCombination(selectedMenuArr: [String], wantMenuCnt: Int) -> [String] {
//        print("selectedMenuArr:\(selectedMenuArr)")
//        print("wantMenuCnt:\(wantMenuCnt)")
        var selectedCntDic: [String : Int] = Dictionary()
        var resultArr: [String] = [String]()
        
        for i in 0..<selectedMenuArr.count {
            let strArr = Array(selectedMenuArr[i])
            if strArr.count < wantMenuCnt {
                continue
            }
            let candidateMenu = getDetailCombination(menuArr: strArr, wantMenuCnt: wantMenuCnt)
            for j in 0..<candidateMenu.count {
                if let candidateCnt = selectedCntDic[candidateMenu[j]] {
                    selectedCntDic[candidateMenu[j]] = candidateCnt + 1
                }
                else {
                    selectedCntDic[candidateMenu[j]] = 1
                }
            }
        }
//        print("정리된 횟수:\(selectedCntDic)")
        var biggestSelectedCombination: Int = 0
        let keys = Array(selectedCntDic.keys)
        for i in 0..<keys.count {
            if selectedCntDic[keys[i]]! >= 2 {
                if selectedCntDic[keys[i]]! > biggestSelectedCombination {
                    resultArr.removeAll()
                    resultArr.append(keys[i])
                    biggestSelectedCombination = selectedCntDic[keys[i]]!
                } else if selectedCntDic[keys[i]] == biggestSelectedCombination {
                    resultArr.append(keys[i])
                }
                else {
                    continue
                }
            }
            else {
                continue
            }
        }
        
        return resultArr
    }
    
    func getDetailCombination(menuArr: [String.Element], wantMenuCnt: Int) -> [String] {
//        print("menuArr:\(menuArr) wantMenuCnt:\(wantMenuCnt)")
        var storage = Set<String>()
        pick(restMenu: menuArr, wantMenuCnt: wantMenuCnt, alreadyPicked: "", storage: &storage)
        return Array(storage)
    }
    
    func pick(restMenu: [String.Element], wantMenuCnt: Int, alreadyPicked: String, storage: inout Set<String>) { //무조건 앞에서부터 순차적으로
        for i in 0..<restMenu.count {
            var alreadyPickedCopy = alreadyPicked
            alreadyPickedCopy = alreadyPickedCopy + String(restMenu[i])
            let alreadyPickedCopyArr = Array(alreadyPickedCopy).sorted(by: { $0 < $1 })
            let resultAlreadyPicked = String(alreadyPickedCopyArr)
            if resultAlreadyPicked.count >= wantMenuCnt {
                storage.insert(resultAlreadyPicked)
            }
            else {
                var restMenuCopy = restMenu
                restMenuCopy.remove(at: i)
                pick(restMenu: restMenuCopy, wantMenuCnt: wantMenuCnt, alreadyPicked: resultAlreadyPicked, storage: &storage)
            }
        }
    }


}

