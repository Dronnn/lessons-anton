//: [Previous](@previous)

import Foundation


// 4. **Обмен валют**: Создайте функцию, которая принимает сумму в долларах и словарь с курсами валют, возвращая сумму в других валютах.

//func exchange(money dollars: Double, rates: [String: Double]) -> [String: Double] {
//    
//}


// *Статус заказа**: Создайте перечисление с разными статусами заказа (enum новый, в обработке, выполнен) и функцию, которая принимает статус и возвращает описание.

//enum Status {
//    case inProgress
//    case new
//    case finished
//}
//
//func description(for status: Status) -> String {
//    switch status {
//    case .inProgress:
//        "в процессе"
//    case .new:
//        "новый"
//    case .finished:
//        "выполнен"
//    }
//}
//
//description(for: .inProgress)




/// функция определяет средний возраст студентов в разных группах
/// - Parameter groups: словарь в формате "название группы": массив целых чисел символизирующих возраст студентов.
/// - Returns: словарь в  формате "название группы": вещественное число со средним возрастом.
func calculateAverageAge(in groups: [String: [Int]]) -> [String: Double] {
    var averageAges: [String: Double] = [:]
    
    for (groupName, ages) in groups {
        let totalAge = ages.reduce(0, +)
        let average = Double(totalAge) / Double(ages.count)
        averageAges[groupName] = average
    }
    
    return averageAges
}

let studentGroups = [
    "Группа1": [19, 20, 21, 22],
    "Группа2": [18, 19, 20],
    "Группа3": [21, 22, 23, 24, 25, 26, 27]
]

let groupAverageAges = calculateAverageAge(in: studentGroups)

print("Средний возраст студентов в группах:")
for (group, averageAge) in groupAverageAges {
    print("\(group): \(averageAge)")
}


































//: [Next](@next)
