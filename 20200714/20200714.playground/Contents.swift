/*
 
 고대 이집트 사람들은 장인의 경지에 오른 엔지니어와 건축가들도 수학적인 지식은 조금의 흠을 가지고 있다. 그 중에 하나가 분수를 취급하는 그들의 체계가 그렇다.

 그 때는 모든 분수는 분자가 1 인 수(단위 분수)만을 다루었다.

 1/2, 1/3, 1/4, 1/5, ...
 복잡한 분수들은 단위 분수의 합으로 표현되어 졌다.
 예를 들어 ,

 3/5 = 1/2 + 1/10 (NOT 1/5 + 1/5 + 1/5) ... 합으로 표현될 때 같은 분모가 두 번이상 나오면 안 된다.
 5/7 = 1/2 + 1/5 + 1/70
 불행하게도 , 그 시대에는 계산기가 없었다.
 당신은 계산기를 가지고 있어, 이들을 단위 분수의 합으로 바꿀 수 있도록 도와 줄 수가 있다.

 분자입력:5
 분모입력:7
 5 / 7 = 1 / 2 + 1 / 5 + 1 / 70

 분자입력:1
 분모입력:5
 1 / 5 = 1 / 5

 분자입력:7
 분모입력:10
 7 / 10 = 1 / 2 + 1 / 5
 
 */

var str = "Hello, playground"

struct Value {
    var numerator:UInt
    var denominator:UInt
    var isInfinity:Bool
}

func solution(numerator:UInt,denominator:UInt) -> String? {
    if denominator == 0 {
        return nil
    }
    var currentNumerator:UInt = numerator
    var currentDenominator:UInt = denominator
    
    var values:Array<Value> = Array()
    
    for i in 2...denominator {
        if Float(currentNumerator)/Float(currentDenominator) >= 1.0/Float(i) {
            let value:Value = Value(numerator: 1, denominator: i, isInfinity: false)
            values.append(value)
            currentNumerator = (currentNumerator * i ) - (1 * currentDenominator)
            currentDenominator = currentDenominator * i
        }
    }
    print("currentNumerator:\(currentNumerator) currentDenominator:\(currentDenominator)")
    if currentNumerator != 0 {
        if currentDenominator%currentNumerator == 0 {
            currentDenominator = currentDenominator/currentNumerator
            currentNumerator = 1
            let value:Value = Value(numerator: currentNumerator, denominator: currentDenominator, isInfinity: false)
            values.append(value)
        }
        else {
            print("이거 무한아닌가??;;;;")
            let value:Value = Value(numerator: 1, denominator: currentDenominator, isInfinity: true)
            values.append(value)
        }
    }
    var returnStr:String = "\(numerator) / \(denominator) = "
    for i in 0..<values.count {
        if i != 0 {
            returnStr = returnStr + " + "
        }
        returnStr = returnStr + "\(values[i].numerator) / \(values[i].denominator)"
        if values[i].isInfinity {
            returnStr = returnStr + "..."
        }
    }
    
    return returnStr
}

print("result:\(solution(numerator: 5, denominator: 7))")
