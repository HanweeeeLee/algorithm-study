//
//  ViewController.swift
//  OpenChatRoom
//
//  Created by hanwe lee on 2021/07/05.
//

import Cocoa
// https://programmers.co.kr/learn/courses/30/lessons/42888

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(solution(["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"])) // ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]
    }
    
    enum Command: String, CaseIterable {
        case enter = "Enter"
        case leave = "Leave"
        case change = "Change"
        static func getCommand(_ inputed: String) -> Command {
            var returnValue: Command = .change
            for item in Command.allCases {
                if inputed == item.rawValue {
                    returnValue = item
                }
            }
            return returnValue
        }
    }
    
    func solution(_ record:[String]) -> [String] {
        var returnValue: [String] = []
        var userMap: [String: String] = [String: String]()
        var historys: [History] = []
        for i in 0..<record.count {
            let item = record[i].components(separatedBy: " ")
            let command: Command = Command.getCommand(item[0])
            switch command {
            case .enter:
                userMap[item[1]] = item[2]
                historys.append(History(userId: item[1], command: .enter))
                break
            case .leave:
                historys.append(History(userId: item[1], command: .leave))
                break
            case .change:
                userMap[item[1]] = item[2]
                break
            }
        }
        
        for history in historys {
            switch history.command {
            case .enter:
                returnValue.append("\(userMap[history.userId]!)님이 들어왔습니다.")
            case .leave:
                returnValue.append("\(userMap[history.userId]!)님이 나갔습니다.")
            case .change:
                print("여기 들어오면 안됨")
                break
            }
        }
        
        return returnValue
    }
    
    struct History {
        let userId: String
        let command: Command
    }


}

