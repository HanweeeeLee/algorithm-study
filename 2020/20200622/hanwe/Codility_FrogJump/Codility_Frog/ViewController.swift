//
//  ViewController.swift
//  Codility_Frog
//
//  Created by hanwe lee on 2020/06/22.
//  Copyright © 2020 hanwe lee. All rights reserved.
//

import UIKit

/*
 A small frog wants to get to the other side of the road. The frog is currently located at position X and wants to get to a position greater than or equal to Y. The small frog always jumps a fixed distance, D.

 Count the minimal number of jumps that the small frog must perform to reach its target.

 Write a function:

 public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int

 that, given three integers X, Y and D, returns the minimal number of jumps from position X to a position equal to or greater than Y.

 For example, given:

   X = 10
   Y = 85
   D = 30
 the function should return 3, because the frog will be positioned as follows:

 after the first jump, at position 10 + 30 = 40
 after the second jump, at position 10 + 30 + 30 = 70
 after the third jump, at position 10 + 30 + 30 + 30 = 100
 Write an efficient algorithm for the following assumptions:

 X, Y and D are integers within the range [1..1,000,000,000];
 X ≤ Y.
 Copyright 2009–2020 by Codility Limited. All Rights Reserved. Unauthorized copying, publication or disclosure prohibited.
 
 https://app.codility.com/programmers/lessons/3-time_complexity/frog_jmp/
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let result = solution(10, 85, 30)
        print("result:\(result)")
    }

    public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
        // write your code in Swift 4.2.1 (Linux)
        var resultInt:Int = 0
//        var currentDistance:Int = X

//        while true {
//            if currentDistance >= Y {
//                break
//            }
//            currentDistance += D
//            resultInt += 1
//        }
        let goal:Int = Y - X
//        print("test:\(goal/D) test2 :\(goal%D)")
        if goal%D != 0 {
            resultInt = goal/D + 1
        }
        else {
            resultInt = goal/D
        }
        
        
        return resultInt
    }

}



