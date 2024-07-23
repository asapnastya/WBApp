// Создайте множество (set) из целых чисел.
// Добавьте несколько элементов в это множество.
// Удалите один элемент.
// Проверьте, существует ли определенный элемент в множестве.
// Примените операции объединения, пересечения и разности на множествах

import Foundation

// MARK: - Создание пустого множества из целых чисел
var numbersSet = Set<Int>()

// MARK: - Добавление нескольких элементов в numbersSet
numbersSet.insert(1)
numbersSet.insert(9)
numbersSet.insert(3)
numbersSet.insert(7)
numbersSet.insert(30)
numbersSet.insert(5)
numbersSet.insert(9) // так как множество - это коллекция уникальных значений, число 9 не будет добавлено во второй раз
print(numbersSet.sorted()) // так как множество - это неупорядоченная коллекция, для удобства можно применить сортировку. Результат [1, 3, 5, 7, 9, 30]

// MARK: - Удаление элемента 30 из numbersSet
numbersSet.remove(30)
print(numbersSet.sorted()) // [1, 3, 5, 7, 9]

// MARK: - Проверка существования элемента 4 в numbersSet
print(numbersSet.contains(4)) // false

// MARK: - Создание yearsSet множества из целых чисел для дальнейших операций
var yearsSet: Set = [1999, 2001, 2012, 1987]

// MARK: - Объединение numbersSet и yearsSet
var unionSet = numbersSet.union(yearsSet)
print(unionSet.sorted()) // [1, 3, 5, 7, 9, 1987, 1999, 2001, 2012]

// MARK: - Пересечение numbersSet и unioinSet возвращает общие для обоих множеств элементы в виде нового множества
let intersectionSet = numbersSet.intersection(unionSet)
print(intersectionSet.sorted()) // [1, 3, 5, 7, 9]

// MARK: - Разность unioinSet и numbersSet через subtracting() - результат возвращается в виде нового множества
let subtractingSet = unionSet.subtracting(numbersSet)
print(intersectionSet.sorted()) // [1, 3, 5, 7, 9]

// MARK: - Симметричная разность unioinSet и numbersSet через symmetricDifference() - результат возвращается в виде нового множества из значений, которые не повторяются в двух входных множествах
let symmetricDifferenceSet = unionSet.symmetricDifference(numbersSet)
print(symmetricDifferenceSet.sorted()) // [1987, 1999, 2001, 2012]

// MARK: - Разность unioinSet и numbersSet через subtract() - оставляет в первом множестве только те элементы, которых нет во втором
unionSet.subtract(numbersSet)
print(unionSet.sorted()) // [1987, 1999, 2001, 2012]
