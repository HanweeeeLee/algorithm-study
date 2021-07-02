# 20210702 lv1 가운데 글자 가져오기
[Link](https://programmers.co.kr/learn/courses/30/lessons/12903)
단어 s의 가운데 글자를 반환하는 함수, solution을 만들어 보세요. 단어의 길이가 짝수라면 가운데 두글자를 반환하면 됩니다.

재한사항
s는 길이가 1 이상, 100이하인 스트링입니다.
입출력 예
s    return
"abcde"    "c"
"qwer"    "we"

```
func solution(_ s: String) -> String {
    var returnValue: String = ""
    let sArr = Array(s)
    if s.count % 2 == 0 { // 짝수개
        returnValue = String(sArr[s.count/2-1]) + String(sArr[s.count/2])
    } else { // 홀수개
        returnValue = String(sArr[s.count/2])
    }
    return returnValue
}
```
