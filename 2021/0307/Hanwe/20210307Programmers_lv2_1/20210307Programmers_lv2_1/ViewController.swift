//
//  ViewController.swift
//  20210307Programmers_lv2_1
//
//  Created by hanwe on 2021/03/07.
//
//https://programmers.co.kr/learn/courses/30/lessons/60057

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("result:\(solution("aabbaccc"))") //7
//        print("result:\(solution("ababcdcdababcdcd"))") //9
//        print("result:\(solution("abcabcdede"))") //8
//        print("result:\(solution("abcabcabcabcdededededede"))") //14
//        print("result:\(solution("xababcdcdababcdcd"))") //17
    }
    func solution(_ s:String) -> Int {
        var shortestCnt: Int = s.count
        let firstIndex = s.index(s.startIndex, offsetBy: 0)
        for i in 0..<s.count { //몇개씩 끊어쓸껀지
            for j in 0..<s.count { //현재 index
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: j+i)
                print("test:\(String(s[start..<end]))")
            }
            print("------")
        }
        return shortestCnt
    }
    
//    func solution(_ s:String) -> Int {
//
//        var shortestCnt: Int = s.count
//
//        var convertStr: String = ""
//        for i in 0..<s.count {
//            var copyS = s
//            for j in i..<s.count {
//                let startIndex = s.index(s.startIndex, offsetBy: i)
//                let endIndx =  s.index(s.startIndex, offsetBy: j)
//                convertStr = String(s[startIndex..<endIndx])
//                print("convertStr:\(convertStr)")
//                copyS = s.replacingOccurrences(of: "\(convertStr)", with:"#").removeOverlap().convertOriginStrCnt(originConvertStr: convertStr)
//                print("copyS:\(copyS)")
//                if shortestCnt > copyS.count {
//                    shortestCnt = copyS.count
//                    print("shortestChanged!")
//                }
//            }
//        }
//
//        return shortestCnt
//    }

}

extension String {
    func removeOverlap() -> String {
        var returnValue = self
        while true {
            if returnValue.contains("##") {
                returnValue = returnValue.replacingOccurrences(of: "##", with:"#")
            }
            else {
                break
            }
        }
        return returnValue
    }
    
    func convertOriginStrCnt(originConvertStr: String) -> String {
        var returnValue = self
        returnValue = returnValue.replacingOccurrences(of: "#", with:"N\(originConvertStr)")
        return returnValue
    }
}

//let firstIndex = returnValue.index(returnValue.startIndex, offsetBy: 0)
//let lastIndex = returnValue.index(returnValue.startIndex, offsetBy: 15)
//returnValue = String(returnValue[firstIndex..<lastIndex])
