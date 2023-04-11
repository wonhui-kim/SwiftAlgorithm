func solution(_ s:String) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    let lowerAlphabet = Array(alphabet)
    let upperAlphabet = Array(alphabet.uppercased())
    var arr = Array(s)
    
    var result = [String]()
    var index = 0
    for i in 0..<arr.count {
        if arr[i] == " " {
            index = 0
            result.append(String(arr[i]))
            continue
        }
        
        if !lowerAlphabet.contains(arr[i]) && !upperAlphabet.contains(arr[i]) {
            result.append(String(arr[i]))
            index += 1
            continue
        }
        
        if index%2 == 0 {
            result.append(String(arr[i]).uppercased())
        } else {
            result.append(String(arr[i]).lowercased())
        }
        index += 1
    }
    
    return result.joined()
}

print(solution("try hello world"))
