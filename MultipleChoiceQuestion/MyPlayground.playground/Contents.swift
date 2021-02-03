struct Employee: Equatable, Comparable{
    var firstName: String
    var lastName: String
    
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

var employee1 = Employee(firstName: "Kevin", lastName: "16")
var employee2 = Employee(firstName: "Kevin", lastName: "18")

if employee1 < employee2 {
    print("employee1 < employee2")
}
