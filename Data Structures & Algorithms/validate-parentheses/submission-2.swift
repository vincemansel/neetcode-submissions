class Solution {
	func isValid(_ s: String) -> Bool {
		let s = Array(s)
		let pSet = Set<Character>(["(", "[", "{"])
		var stack = [Character]()
		
		for c in s {
			if c ==  "(" || c == "[" || c == "{" {
				stack.append(c)
			}
			else if let last = stack.last {
				if (last == "(" && c == ")") ||
				   (last == "[" && c == "]") ||
					 (last == "{" && c == "}") {
					stack.removeLast()
				}
				else {
					return false
				}
			}
			else {
				return false
			}
		}
		
        guard stack.isEmpty else { return false }
		return true 
	}
}
