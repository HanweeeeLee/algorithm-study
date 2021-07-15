//
//  ViewController.swift
//  chuseok
//
//  Created by hanwe on 2021/07/15.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        print("1: \(solution(["2016-09-15 01:00:04.001 2.0s","2016-09-15 01:00:07.000 2s"]))") // 1
//        print("2: \(solution(["2016-09-15 01:00:04.002 2.0s","2016-09-15 01:00:07.000 2s"]))") // 2
//        print("3: \(solution(["2016-09-15 20:59:57.421 0.351s","2016-09-15 20:59:58.233 1.181s","2016-09-15 20:59:58.299 0.8s","2016-09-15 20:59:58.688 1.041s","2016-09-15 20:59:59.591 1.412s","2016-09-15 21:00:00.464 1.466s","2016-09-15 21:00:00.741 1.581s","2016-09-15 21:00:00.748 2.31s","2016-09-15 21:00:00.966 0.381s","2016-09-15 21:00:02.066 2.62s"]))") // 7
        print("4: \(solution(["2016-09-15 01:00:04.001 2.0s", "2016-09-15 01:00:07.000 2s"]))") // 2
        
    }
    
    struct Process {
        var number: Int
        var startTime: Date
        var endTime: Date
    }
    
    func solution(_ lines:[String]) -> Int {
        var currentRunningProcesses: [Process] = []
        var processes: [Process] = []
        var maxCnt: Int = 0
        
        var cnt = 0
        for item in lines {
            let splited = item.split(separator: " ")
            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
            let endDate: Date = dateFormatter.date(from: String(splited[0]) + " " + String(splited[1]) + "0")!
            
            var duringTimeStr = String(splited[2])
            duringTimeStr.removeLast()
            let duringTimeInterval = TimeInterval.init(Double(duringTimeStr)!)
            
            let newProcess = Process(number: cnt, startTime: endDate.addingTimeInterval(-duringTimeInterval), endTime: endDate)
            processes.append(newProcess)
            cnt += 1
        }
        let sortedProcesses = processes.sorted(by: { $1.startTime > $0.startTime })
        for item in sortedProcesses {
            currentRunningProcesses.append(item)
            currentRunningProcesses = removeDoneProcesses(currentTime: item.startTime, currentRunningProcesses)
            if currentRunningProcesses.count > maxCnt {
                maxCnt = currentRunningProcesses.count
            }
        }
        
        
        
        return maxCnt
    }
    
    func removeDoneProcesses(currentTime: Date, _ arr: [Process]) -> [Process] {
        var returnArr: [Process] = []
        
        for i in 0..<arr.count {
            if currentTime.addingTimeInterval(0.001).timeIntervalSinceReferenceDate >= arr[i].endTime.addingTimeInterval(1).timeIntervalSinceReferenceDate {
                continue
            } else {
                returnArr.append(arr[i])
            }
        }
        
        return returnArr
    }


}

