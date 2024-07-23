//Создайте словарь, где ключами будут строки (названия городов), а значениями — целые числа (их население).
//Добавьте несколько пар ключ-значение в словарь.
//Удалите одну пару ключ-значение.
//Обновите значение для одного из ключей.
//Получите значение для одного из ключей.

import Foundation

// MARK: - Создание пустого словаря, который будет хранить [String: Int]
var citiesPopulation: [String: Int] = [:]

// MARK: - Добавление нескольких пар ключ(город)-значение(население) в словарь
citiesPopulation["New York"] = 8467513
citiesPopulation["Munich"] = 1389091
citiesPopulation["Helsinki"] = 674963
citiesPopulation["Amsterdam"] = 869709

// Реализация сортировки в словаре для удобства, так как словарь - это неупорядоченная коллекция
let sortedCitiesPopulation = citiesPopulation.sorted { $0.key < $1.key }
sortedCitiesPopulation.forEach { city, population in
    print("\(city): \(population) people")
}
//Результат после добавления элементов в словарь
//Amsterdam: 869709 people
//Helsinki: 674963 people
//Munich: 1389091 people
//New York: 8467513 people

// Другой способ добавления пар ключ-значение в словарь
//citiesPopulation.updateValue(8467513, forKey: "New York")
//citiesPopulation.updateValue(1389091, forKey: "Munich")
//citiesPopulation.updateValue(674963, forKey: "Helsinki")
//citiesPopulation.updateValue(869709, forKey: "Amsterdam")

// MARK: - Удаление пары ключ-значение с ключом "New York" из словаря
citiesPopulation.removeValue(forKey: "New York")

let sortedAfterRemovalCitiesPopulation = citiesPopulation.sorted { $0.key < $1.key }
sortedAfterRemovalCitiesPopulation.forEach { city, population in
    print("\(city): \(population) people")
}
//Результат после удаления элемента из словаря
//Amsterdam: 869709 people
//Helsinki: 674963 people
//Munich: 1389091 people

// Другой способ удаления пары ключ-значение с ключом "New York" из словаря
//citiesPopulation["New York"] = nil

// MARK: - Обновление значения для ключа "Munich"
citiesPopulation["Munich"] = 1561094

let sortedAfterUpdateCitiesPopulation = citiesPopulation.sorted { $0.key < $1.key }
sortedAfterUpdateCitiesPopulation.forEach { city, population in
    print("\(city): \(population) people")
}
//Результат после обновления значения для ключа "Munich"
//Amsterdam: 869709 people
//Helsinki: 674963 people
//Munich: 1561094 people

// Другой способ обновления значения для ключа "Munich"
//citiesPopulation.updateValue(1561094, forKey: "Munich")

// MARK: - Получение значения для ключа "Munich"
if let munichPopulation = citiesPopulation["Munich"] {
    print("Population of Munich is \(munichPopulation) people")
} else {
    print("This city is not in the dictionary")
}
