//
//  ViewController.swift
//  20210329_lv2
//
//  Created by hanwe on 2021/03/29.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("sample1: \(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))") //"HELLO"
        print("sample1: \(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))") //"FOO"
        print("sample1: \(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))") //"WORLD"
    }
    
    func solution(_ m:String, _ musicinfos:[String]) -> String {
        var returnName: String = ""
        var maxRunningTime: Int = 0
        var copyM = transformSharpChar(m)
        print("copyM:\(copyM)")
        var copyFos: [String] = []
        for i in 0..<musicinfos.count {
            copyFos.append(transformSharpChar(musicinfos[i]))
        }
        for i in 0..<copyFos.count {
            let itemArr = copyFos[i].components(separatedBy: ",")
            let formatter: DateFormatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            guard let startTime = formatter.date(from: itemArr[0]) else {
                print("망함1")
                return ""
            }
            guard let endTime = formatter.date(from: itemArr[1]) else {
                print("망함2")
                return ""
            }
            let timeOffset = Int(endTime.timeIntervalSince(startTime)/60)
            let name: String = itemArr[2]
            let rhythm: String = itemArr[3]
            rhythm.count/timeOffset
            let repeatCnt: Int = timeOffset/rhythm.count
            let rest: Int = timeOffset%rhythm.count
            var spreadedRhythm: String = ""
            for _ in 0..<repeatCnt {
                spreadedRhythm = spreadedRhythm + rhythm
            }
            spreadedRhythm = spreadedRhythm + cutStringFromFront(originString: rhythm, endIndex: rest)
            print("spreadedRhythm:\(spreadedRhythm)")
            if spreadedRhythm.contains(copyM) {
                if timeOffset > maxRunningTime {
                    returnName = name
                }
            }
        }
        if returnName == "" {
            returnName = "(none)"
        }
        return returnName
    }
    
    func transformSharpChar(_ inputStr: String) -> String {
        var returnValue: String = ""
        returnValue = inputStr
        returnValue = returnValue.replacingOccurrences(of: "C#", with: "c")
        returnValue = returnValue.replacingOccurrences(of: "D#", with: "d")
        returnValue = returnValue.replacingOccurrences(of: "F#", with: "f")
        returnValue = returnValue.replacingOccurrences(of: "G#", with: "g")
        returnValue = returnValue.replacingOccurrences(of: "A#", with: "a")
        return returnValue
    }
    
    func cutStringFromFront(originString: String, endIndex: Int) -> String {
        let firstIndex = originString.index(originString.startIndex, offsetBy: 0)
        let lastIndex = originString.index(originString.startIndex, offsetBy: endIndex)
        return String(originString[firstIndex..<lastIndex])
    }


}

