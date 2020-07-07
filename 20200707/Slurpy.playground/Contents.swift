/*
 
 스러피(Slurpy)란 어떠한 속성이 존재하는 문자열이다. 문자열을 읽어서 스러피가 존재하는지를 판단하는 프로그램을 작성해야 한다.

 스럼프(Slump)는 다음 속성을 갖는 문자열이다.

 첫 번째 문자가 'D' 또는 'E'이다.
 첫 번째 문자 뒤에는 하나 이상의 'F'가 나온다.
 하나 이상의 'F' 뒤에는 또 다른 스럼프나 'G'가 온다. 스럼프는 'F' 끝에 오는 스럼프나 'G'로끝난다. 예를 들어, DFFEFFFG는 첫 번째 문자가 'D'로 시작하고 두 개의 'F'가 나오며, 또 다른스럼프 'EFFFG'로 끝난다.
 위의 경우가 아니면 스럼프가 아니다.
 스림프(Slimp)는 다음 속성을 갖는 문자열이다.

 첫 번째 문자는 'A'이다.
 두 개의 문자로만 된 스림프면, 두 번째 문자는 'H'이다.
 두 개의 문자로 된 스림프가 아니면 다음 형식 중의 하나가 된다.
 'A' + 'B' + 스림프 + 'C'.
 'A' + 스럼프 + 'C'.
 위의 경우가 아니면 스림프가 아니다.
 스러피(Slurpy)는 스림프(Slimp) 뒤에 스럼프(Slump)로 구성되는 문자열이다.

 다음은 그 예이다.

 Slumps : DFG, EFG, DFFFFFG, DFDFDFDFG, DFEFFFFFG
 Not Slumps: DFEFF, EFAHG, DEFG, DG, EFFFFDG
 Slimps: AH, ABAHC, ABABAHCC, ADFGC, ADFFFFGC, ABAEFGCC, ADFDFGC
 Not Slimps: ABC, ABAH, DFGC, ABABAHC, SLIMP, ADGC
 Slurpys: AHDFG, ADFGCDFFFFFG, ABAEFGCCDFEFFFFFG
 Not Slurpys: AHDFGA, DFGAH, ABABCC
 입력
 입력될 문자열의 개수를 나타내는 정수 N 이 1 ~ 10의 범위로 우선 입력된다. 다음 줄부터 N개의 문자열이 입력된다. 문자열은 1 ~ 60 개의 알파벳 문자로 구성된다.

 출력
 첫 줄에는 "SLURPYS OUTPUT"을 출력한다. N 개의 문자열 입력에 대해서 각 문자열이 스러피인지를 "YES" 또는 "NO"로 표기한다. 마지막으로 "END OF OUTPUT"를 출력한다.

 Sample Input

 2
 AHDFG
 DFGAH
 Sample Output

 SLURPYS OUTPUT
 YES
 NO
 END OF OUTPUT
 
 */



import UIKit

var str = "Hello, playground"

func slurpyPrint(N:Int,S:String) {
    let inputStrArr = S.components(separatedBy: "\n")
    print("SLURPYS OUTPUT")
    for i in 0..<N {
        if isSlurpy(inputStr: inputStrArr[i]) {
            print("YES")
        }
        else {
            print("NO")
        }
    }
    print("END OF OUTPUT")
}

//스림프(Slimp)는 다음 속성을 갖는 문자열이다.
//
//첫 번째 문자는 'A'이다.
//두 개의 문자로만 된 스림프면, 두 번째 문자는 'H'이다.
//두 개의 문자로 된 스림프가 아니면 다음 형식 중의 하나가 된다.
//'A' + 'B' + 스림프 + 'C'.
//'A' + 스럼프 + 'C'.
//위의 경우가 아니면 스림프가 아니다.

func slimpExchanger(inputStr:String) -> String { //최소 2개는 있어야한다. @
    var newStr:String = inputStr
    var inputStrArr:Array = Array(newStr)
    var slimpIndex:Int = -1
    if inputStrArr.count > 1 {
        if inputStrArr[0] == "A" {
            for i in 1..<inputStrArr.count {
                if inputStrArr[i] == "H" {
                    if inputStrArr[i-1] == "A" {
                        slimpIndex = i-1
                        break
                    }
                }
            }
        }
    }
    
    if slimpIndex != -1 {
        let startIndex = newStr.index(newStr.startIndex, offsetBy: slimpIndex)
        let endIndex = newStr.index(startIndex, offsetBy: 1)
        newStr.replaceSubrange(startIndex...endIndex, with: "@")
        newStr = innerSlimpExchanger(inputStr: newStr)
    }
    print("\(newStr)")
    
    return newStr
}
func innerSlimpExchanger(inputStr:String) -> String {
    var newStr:String = inputStr
    var newStrArr:Array = Array(newStr)
    var atIndex:Int = -1
    for i in 0..<newStr.count {
        
    }
    
    return newStr
}

func slumpExchanger(inputStr:String) -> String { //최소 3개는 있어야한다. #
    return ""
}

func isSlurpy(inputStr:String) -> Bool { //스림프(Slimp) 뒤에 스럼프(Slump)로 구성되는 문자열이다.
    var isSlurpy:Bool = false
    var checkStr:String = inputStr
    
    checkStr = slimpExchanger(inputStr: checkStr)
    checkStr = slumpExchanger(inputStr: checkStr)
    
    if checkStr == "@#" {
        isSlurpy = true
    }
    
    return isSlurpy
}
extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }

    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}

slurpyPrint(N: 2, S: "AHDFG\nDFGAH")
