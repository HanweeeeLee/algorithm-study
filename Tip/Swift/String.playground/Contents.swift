import UIKit
import Foundation

let originString = "hello world"

//MARK: 문자열 치환
func switchString() {
    print("문자열 치환: \(originString.replacingOccurrences(of: " ", with: " !"))")
}
switchString()

//MARK: 문자열 앞에서부터 자르기
func cutStringFromFront() {
    let firstIndex = originString.index(originString.startIndex, offsetBy: 0)
    let lastIndex = originString.index(originString.startIndex, offsetBy: 5)
    print("문자열 앞에서부터 자르기: \(String(originString[firstIndex..<lastIndex]))")
}
cutStringFromFront()

//MARK: 문자열 뒤에서부터 자르기
func cutStringFromBack() {
    let backwordFirstIndex = originString.index(originString.endIndex, offsetBy: -5)
    let backwordLastIndex = originString.index(originString.endIndex, offsetBy: 0)
    print("문자열 뒤에서부터 자르기: \(String(originString[backwordFirstIndex..<backwordLastIndex]))")
}
cutStringFromBack()

//MARK: 문자열 뒤집기
func reverseString() {
    let originStringArr = Array(originString)
    let reverseOriginStringArr = Array(originStringArr.reversed())
    print("문자열 뒤집기: \(String(reverseOriginStringArr))")
    
}
reverseString()

//MARK: 특정 인덱스의 캐릭터 가져오기
func getCharFromIndex(index: Int) {
    let originStringArr = Array(originString)
    print("특정 인덱스의 캐릭터 가져오기: \(String(originStringArr[index]))")
}
getCharFromIndex(index: 0)
getCharFromIndex(index: 3)

//MARK: 특정 시작 인덱스부터 끝 인덱스까지의 문자열 가져오기
func cutString(fromIndex: Int, toIndex: Int) {
    let firstIndex = originString.index(originString.startIndex, offsetBy: fromIndex)
    let lastIndex = originString.index(originString.startIndex, offsetBy: toIndex)
    print("특정 시작 인덱스부터 끝 인덱스까지의 문자열 가져오기: \(String(originString[firstIndex...lastIndex]))")
}
cutString(fromIndex: 1, toIndex: 3)

//MARK: 특정 인덱스의 문자 지우기
func removeChar(atIndex: Int) {
    let removedIndex = originString.index(originString.startIndex, offsetBy: atIndex)
    var copyOriginString = originString
    copyOriginString.remove(at: removedIndex)
    print("특정 인덱스의 문자 지우기: \(copyOriginString)")
}
removeChar(atIndex: 1)

//MARK: 특정 인덱스에 문자 넣기
func insertChar(atIndex: Int, char: String) {
    let insertedIndex = originString.index(originString.startIndex, offsetBy: atIndex)
    var copyOriginString = originString
    copyOriginString.insert(Character(char), at: insertedIndex)
    print("특정 인덱스에 문자 넣기: \(copyOriginString)")
}
insertChar(atIndex: 1, char: "!")
