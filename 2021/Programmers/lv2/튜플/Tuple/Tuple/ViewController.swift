//
//  ViewController.swift
//  Tuple
//
//  Created by hanwe lee on 2021/07/08.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("1: \(solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))") // [2, 1, 3, 4]
        print("2: \(solution("{{1,2,3},{2,1},{1,2,4,3},{2}}"))") // [2, 1, 3, 4]
        print("3: \(solution("{{20,111},{111}}"))") // [111, 20]
        print("4: \(solution("{{123}}"))") // [123]
        print("5: \(solution("{{4,2,3},{3},{2,3,4,1},{2,3}}"))") // [3, 2, 4, 1]
    }
    
    func solution(_ s: String) -> [Int] {
        var copyS = s
        copyS.removeFirst()
        copyS.removeLast()
        let copySArr = copyS.split(separator: "}")
        
        if copySArr.count == 0 {
            return []
        }
        
        let sortedCopySArr = copySArr.sorted(by: { $1.count > $0.count })
        
        var returnValue: [Int] = makeArr(String(sortedCopySArr[0]))
        for i in 0..<(sortedCopySArr.count - 1) {
            let newArr = makeArr(String(sortedCopySArr[i+1]))
            appendNewValue(&returnValue, new: newArr)
        }
        
        return returnValue
    }
    
    func appendNewValue(_ origin: inout [Int], new: [Int]) {
        let newElement = new.filter({ (value: Int) -> Bool in return (!origin.contains(value))
            
        })
        origin.append(newElement[0])
    }
    
    func makeArr(_ origin: String) -> [Int] {
        var copyOrigin = origin
        if copyOrigin.hasPrefix(",") {
            copyOrigin.removeFirst()
        }
        copyOrigin.removeFirst()
        let splitArr = copyOrigin.split(separator: ",")
        var returnArr: [Int] = []
        for item in splitArr {
            returnArr.append(Int(item)!)
        }
        return returnArr
    }


}

