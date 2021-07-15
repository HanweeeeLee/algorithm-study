//
//  ViewController.swift
//  Song
//
//  Created by hanwe on 2021/07/15.
//

import Cocoa

class ViewController: NSViewController {
            
            
        
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("1:\(solution("ABCDEFG", ["12:00,12:14,HELLO,CDEFGAB", "13:00,13:05,WORLD,ABCDEF"]))") // "HELLO"
//        print("2:\(solution("CC#BCC#BCC#BCC#B", ["03:00,03:30,FOO,CC#B", "04:00,04:08,BAR,CC#BCC#BCC#B"]))") // "FOO"
        print("3:\(solution("ABC", ["12:00,12:14,HELLO,C#DEFGAB", "13:00,13:05,WORLD,ABCDEF"]))") // "WORLD"
        
    }
    
    struct MusicInfo {
        var playTime: Int
        var name: String
        var code: String
        var playedCode: String
    }
    
    func solution(_ m:String, _ musicinfos:[String]) -> String {
        var musicInfosArr: [MusicInfo] = []
        for item in musicinfos {
            let splited = item.split(separator: ",")
            let playedTime = getPlayTime(String(splited[0]), String(splited[1]))
            let name = String(splited[2])
            let code = convertCode(String(splited[3]))
            let playedCode = getPlayedCode(code: code, playedTime: playedTime)
            let newInfo: MusicInfo = MusicInfo(playTime: playedTime, name: name, code: code, playedCode: playedCode)
            musicInfosArr.append(newInfo)
        }
        let convertM = convertCode(m)
        var savedName: String = ""
        var savedTime: Int = 0
        for item in musicInfosArr {
            if item.playedCode.contains(convertM) {
                if item.playTime > savedTime {
                    savedName = item.name
                    savedTime = item.playTime
                }
            }
        }
        
        
        return savedName != "" ? savedName : "(None)"
    }
    
    func getPlayTime(_ startTime: String, _ endTime: String) -> Int {
        let startSplited = startTime.split(separator: ":")
        let startHour: Int = Int(String(startSplited[0]))!
        let startMin: Int = Int(String(startSplited[1]))!
        
        let endSplited = endTime.split(separator: ":")
        let endHour: Int = Int(String(endSplited[0]))!
        let endMin: Int = Int(String(endSplited[1]))!
        
        var subHour = endHour - startHour
        if 0 > subHour {
            subHour += 24
        }
        return endMin - startMin + (subHour * 60)
    }
    
    func getPlayedCode(code: String, playedTime: Int) -> String {
        var result: String = ""
        
        let loop = playedTime/code.count
        let rest = playedTime%code.count
        
        for _ in 0..<loop {
            result += code
        }
        
        let codeArr = Array(code)
        for i in 0..<rest {
            result.append(codeArr[i])
        }
        
        return result
    }
    
    func convertCode(_ code: String) -> String {
        var newCode: String = ""
        let codeArr = Array(code)
        for i in 0..<codeArr.count {
            if codeArr[i] == "#" {
                continue
            }
            if i + 1 != codeArr.count {
                if codeArr[i+1] == "#" {
                    newCode.append(codeArr[i].lowercased())
                } else {
                    newCode.append(codeArr[i])
                }
            } else {
                newCode.append(codeArr[i])
            }
        }
        
        return newCode
    }
    
    

}

