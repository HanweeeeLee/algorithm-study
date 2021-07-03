//
//  ViewController.swift
//  Dart
//
//  Created by hanwe on 2021/07/03.
//

import Cocoa

class ViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1:\(solution("1S2D*3T"))") // 37
        print("2:\(solution("1D2S#10S"))") // 9
        print("3:\(solution("1D2S0T"))") // 3
        print("4:\(solution("1S*2T*3S"))") // 23
        print("5:\(solution("1D#2S*3S"))") // 5
        print("6:\(solution("1T2D3D#"))") // -4
        print("7:\(solution("1D2S3T*"))") // 59
    }
    
    enum SquareType: String, CaseIterable {
        case single = "S"
        case double = "D"
        case triple = "T"
        
        static func isContain(_ inputed: String) -> Bool {
            var returnValue: Bool = false
            for item in SquareType.allCases {
                if inputed == item.rawValue {
                    returnValue = true
                    break
                }
            }
            return returnValue
        }
        
        static func getSquareType(_ inputed: String) -> SquareType {
            var returnValue: SquareType = .single
            for item in SquareType.allCases {
                if inputed == item.rawValue {
                    returnValue = item
                    break
                }
            }
            return returnValue
        }
    }
    
    enum OptionType: String, CaseIterable{
        case start = "*"
        case oups = "#"
        case none = "_"
        
        static func isContain(_ inputed: String) -> Bool {
            var returnValue: Bool = false
            for item in OptionType.allCases {
                if inputed == item.rawValue {
                    returnValue = true
                    break
                }
            }
            return returnValue
        }
        
        static func getOptionType(_ inputed: String) -> OptionType {
            var returnValue: OptionType = .none
            for item in OptionType.allCases {
                if inputed == item.rawValue {
                    returnValue = item
                    break
                }
            }
            return returnValue
        }
    }
    
    func solution(_ dartResult:String) -> Int {
        let dartResultArr = Array(dartResult)
        
        var pointArr: [Int] = []
        
        var pointBuffer: String = ""
        var square: SquareType = .single
        var option: OptionType = .none
        var optionFlag: Bool = false
        for i in 0..<dartResultArr.count {
            if SquareType.isContain(String(dartResultArr[i])) {
                square = SquareType.getSquareType(String(dartResultArr[i]))
                optionFlag = true
            } else if OptionType.isContain(String(dartResultArr[i])) {
                option = OptionType.getOptionType(String(dartResultArr[i]))
                optionFlag = true
            } else {
                if optionFlag {
                    optionFlag = false
                    var beforePoint: Int? = nil
                    if pointArr.count > 0 {
                        beforePoint = pointArr.last
                    }
                    let newPoint = getPoint(point: Int(pointBuffer)!, square: square, option: option, beforePoint: beforePoint)
                    if newPoint.before != nil {
                        pointArr.removeLast()
                        pointArr.append(newPoint.before!)
                    }
                    pointArr.append(newPoint.current)
                    pointBuffer = ""
                    square = .single
                    option = .none
                }
                pointBuffer.append(String(dartResultArr[i]))
            }
        }
        if pointArr.count == 2 {
            if pointBuffer != "" {
                var beforePoint: Int? = nil
                if pointArr.count > 0 {
                    beforePoint = pointArr.last
                }
                let newPoint = getPoint(point: Int(pointBuffer)!, square: square, option: option, beforePoint: beforePoint)
                if newPoint.before != nil {
                    pointArr.removeLast()
                    pointArr.append(newPoint.before!)
                }
                pointArr.append(newPoint.current)
                pointBuffer = ""
                square = .single
                option = .none
            }
        }
        
        var sum: Int = 0
        for item in pointArr {
            sum += item
        }
        
        return sum
    }
    
    struct GetPontResult {
        var before: Int?
        var current: Int
    }
    
    func getPoint(point: Int, square: SquareType, option: OptionType, beforePoint: Int?) -> GetPontResult {
        var resultPoint: Int = point
        switch square {
        case .single:
            break
        case .double:
            resultPoint = resultPoint * resultPoint
        case .triple:
            resultPoint = resultPoint * resultPoint * resultPoint
        }
        
        var before: Int? = beforePoint
        switch option {
        case .none:
            break
        case .start:
            resultPoint = resultPoint * 2
            if before != nil {
                before = before! * 2
            }
        case .oups:
            resultPoint = resultPoint * -1
        }
        
        
        
        
        return GetPontResult(before: before, current: resultPoint)
    }


}

