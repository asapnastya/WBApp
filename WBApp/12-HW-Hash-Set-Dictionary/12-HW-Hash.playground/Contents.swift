// Напишите функцию на Swift, которая принимает строку и возвращает её хеш, используя встроенную функцию hash().
// Придумайте и реализуйте собственную простую хеш-функцию для строк.

import Foundation

// MARK: - Создание функции, которая принимает строку и возвращает ее хеш, используя встроенную функцию hash()
private func getStringHash(_ string: String) -> Int {
    return string.hash
}

// Пример
let burger = "Quarter Pounder"
let burgerHashValue = getStringHash(burger)
print("Hash of \(burger) -> \(burgerHashValue)")

// MARK: - Реализация собственной хеш-функции для строк

// Функция для вычисления хеша строки с использованием алгоритма SDBM
private func getSdbmHash(_ string: String) -> Int {
    let unicodeScalars = string.unicodeScalars.map { $0.value } // преобразуем каждый символ строки в его числовое значение unicode
    return unicodeScalars.reduce(.zero) { currentHash, unicodeValue in // используем метод reduce для вычисления хеша по всем числовым значениям символов
        Int(unicodeValue) &+ (currentHash << 6) &+ (currentHash << 16) - currentHash // вычисляем хеш на основе текущего хеша и unicode-значения символа
    }
}

// Пример
let drink = "Coca Cola"
let drinkHashValue = getSdbmHash(drink)
print("Hash of \(drink) -> \(drinkHashValue)")
