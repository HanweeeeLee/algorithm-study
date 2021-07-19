//
//  ViewController.swift
//  SearchRank
//
//  Created by hanwe on 2021/07/19.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("1: \(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))") // [1,1,1,1,2,4]
    }
    
//    enum Lan: String, CaseIterable {
//        case java = "java"
//        case python = "python"
//        case cpp = "cpp"
//
//        static func getEnum(_ inputed: String) -> Lan {
//            var returnValue: Lan = .cpp
//            for item in Lan.allCases {
//                if inputed == item.rawValue {
//                    returnValue = item
//                    break
//                }
//            }
//            return returnValue
//        }
//    }
//
//    enum Position: String, CaseIterable {
//        case frontend = "frontend"
//        case backend = "backend"
//        static func getEnum(_ inputed: String) -> Position {
//            var returnValue: Position = .backend
//            for item in Position.allCases {
//                if inputed == item.rawValue {
//                    returnValue = item
//                    break
//                }
//            }
//            return returnValue
//        }
//    }
//
//    enum Level: String, CaseIterable {
//        case junior = "junior"
//        case senior = "senior"
//        static func getEnum(_ inputed: String) -> Level {
//            var returnValue: Level = .junior
//            for item in Level.allCases {
//                if inputed == item.rawValue {
//                    returnValue = item
//                    break
//                }
//            }
//            return returnValue
//        }
//    }
//
//    enum Food: String, CaseIterable {
//        case chicken = "chicken"
//        case pizza = "pizza"
//        static func getEnum(_ inputed: String) -> Food {
//            var returnValue: Food = .chicken
//            for item in Food.allCases {
//                if inputed == item.rawValue {
//                    returnValue = item
//                    break
//                }
//            }
//            return returnValue
//        }
//    }
//
//    struct User {
//        let lan: Lan
//        let position: Position
//        let level: Level
//        let food: Food
//        let score: Int
//    }
//
//    func solution(_ info:[String], _ query:[String]) -> [Int] {
//        var userPool: [User] = []
//        for item in info {
//            let splited = item.split(separator: " ")
//            let lan = Lan.getEnum(String(splited[0]))
//            let position = Position.getEnum(String(splited[1]))
//            let level = Level.getEnum(String(splited[2]))
//            let food = Food.getEnum(String(splited[3]))
//            userPool.append(User(lan: lan, position: position, level: level, food: food, score: Int(splited[4])!))
//        }
//
//        var result: [Int] = []
//
//        for item in query {
//            result.append(getQueryCnt(query: item, pool: userPool))
//        }
//
//
//        return result
//    }
//
//    func getQueryCnt(query: String, pool: [User]) -> Int {
//        var copyPool = pool
//
//        let splited = query.split(separator: " ").filter({ $0 != "and" })
//        var lan: Lan?
//        if String(splited[0]) != "-" {
//            lan = Lan.getEnum(String(splited[0]))
//        }
//        if lan != nil {
//            copyPool = copyPool.filter({ $0.lan == lan! })
//            if copyPool.count == 0 {
//                return 0
//            }
//        }
//
//        var position: Position?
//        if String(splited[1]) != "-" {
//            position = Position.getEnum(String(splited[1]))
//        }
//        if position != nil {
//            copyPool = copyPool.filter({ $0.position == position! })
//            if copyPool.count == 0 {
//                return 0
//            }
//        }
//
//        var level: Level?
//        if String(splited[2]) != "-" {
//            level = Level.getEnum(String(splited[2]))
//        }
//        if level != nil {
//            copyPool = copyPool.filter({ $0.level == level! })
//            if copyPool.count == 0 {
//                return 0
//            }
//        }
//
//        var food: Food?
//        if String(splited[3]) != "-" {
//            food = Food.getEnum(String(splited[3]))
//        }
//        if food != nil {
//            copyPool = copyPool.filter({ $0.food == food! })
//            if copyPool.count == 0 {
//                return 0
//            }
//        }
//
//        var score: Int?
//        if String(splited[4]) != "-" {
//            score = Int(String(splited[4]))
//        }
//        if score != nil {
//            copyPool = copyPool.filter({ $0.score >= score! })
//        }
//
//        return copyPool.count
//    }

    func solution(_ info:[String], _ query:[String]) -> [Int] {
        var dict = [String:[Int]]()
        var answer = [Int]()
        
        for item in info {
            let array = item.components(separatedBy: " ")
            let languages = [array[0], "-"]
            let jobs = [array[1], "-"]
            let careers = [array[2], "-"]
            let foods = [array[3], "-"]
            let score = Int(array[4])!
            
            for language in languages {
                for job in jobs {
                    for career in careers {
                        for food in foods {
                            let key = "\(language)\(job)\(career)\(food)"
                            if dict[key] == nil {
                                dict[key] = [score]
                            } else {
                                dict[key]?.append(score)
                            }
                        }
                    }
                }
            }
        }
        
        for item in dict {
            let sorted = item.value.sorted()
            dict[item.key] = sorted
        }
        
        for item in query {
            let array = item.components(separatedBy: " ")
            let arr = array.filter {$0 != "and"}
            let key = "\(arr[0])\(arr[1])\(arr[2])\(arr[3])"
            let score = Int(arr[4])!
            
            if let scoreArr = dict[key] {
                var low = 0
                var high = scoreArr.count - 1
                var mid = 0
                
                while low <= high {
                    mid = (low+high) / 2
                    if scoreArr[mid] < score {
                        low = mid + 1
                    } else {
                        high = mid - 1
                    }
                }
                answer.append(scoreArr.count - low)
            } else {
                answer.append(0)
            }
        }

        return answer
    }
}

