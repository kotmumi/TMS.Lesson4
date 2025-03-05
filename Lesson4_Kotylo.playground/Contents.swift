import Foundation
// MARK: -1. Написать функции, которая:
//- Будет просто выводить в консоль ”Hello, world!”.
//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции должен быть следующим - printHi(“Misha”)).
//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”.

func printHello() {
    print("Hello, world!")
}

func printHello(_ name: String) {
    print("Hello, \(name)!")
}

func getHello(_ name: String) -> String {
    "Hello! \(name)"
}
//Test
print("------------task 1------------")
printHello()
printHello("Misha")
printHello(getHello("Andrei"))

// MARK: -2. Написать функцию, которая принимает две строки и возвращает сумму количества символов двух строк.

func sumSymbols(_ str1: String, _ str2: String) -> Int {
    str1.count + str2.count
}

//Test
print("------------task 2------------")
print(getHello("Ivan") + " how are you?")
print("Count of symbols in strings: \(sumSymbols(getHello("Ivan"), " how are you?"))")

// MARK: -3. Написать функцию, которая выводит в консоль квадрат переданного числа.

func printSquare(_ num: Int) {
    print(num * num)
}

//Test
print("------------task 3------------")
printSquare(5)

// MARK: -4. Создать функцию, которая принимает параметры и вычисляет площадь круга.

func areaCircle(radius: Double) -> Double {
    .pi * radius * radius
}

//Test
print("------------task 4------------")
print("Area of ​​a circle = \(areaCircle(radius: 20)) мм")

// MARK: -5. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает
//строку с описанием времени суток. Можно делать с логическим типом, можно делать со временем.

func timeOfDay(isNight: Bool) -> String {
    isNight ? "It's night now" : "It's day now"
}
//or

//Test
print("------------task 5------------")
print(timeOfDay(isNight: true))
print(timeOfDay(isNight: false))

// MARK: -6. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и
//возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или осень).

func seasonOfYear(_ month: Int) -> String? {
    switch month {
    case 1, 2, 12:
        return "Winter"
    case 3...5:
        return "Spring"
    case 6...8:
        return "Summer"
    case 9...11:
        return "Autumn"
    default:
        return nil
    }
}

//Test
print("------------task 6------------")
print(seasonOfYear(1) ?? "Error")
print(seasonOfYear(4) ?? "Error")
print(seasonOfYear(8) ?? "Error")
print(seasonOfYear(9) ?? "Error")
print(seasonOfYear(-1) ?? "Error")

// MARK: -7. Разбить номер телефона на составляющие. Код страны, код оператора, сам номер.
//Используем функции строки: prefix, suffix.

func phoneNumberComponents(_ phoneNumber: String) -> (countryCode: String, operatorCode: String, number: String) {
    
    let countryCodeLength = 3
    let operatorCodeLength = 2
    
    let countryCode = String(phoneNumber.prefix(countryCodeLength))
    let operatorCode = String(phoneNumber.dropFirst(countryCodeLength).prefix(operatorCodeLength))
    let number = String(phoneNumber.suffix(phoneNumber.count - countryCodeLength - operatorCodeLength))
    
    return (countryCode, operatorCode, number)
}

//Regex
func phoneNumberComponentsRegex(_ phoneNumber: String) ->(countryCode: String, operatorCode: String, number: String)? {
  
    let search = /\+?\s?(\d{3})\s?\-?\s?\(?(\d{2})\)?\s?\-?\s?(\d{3})\s?\-?\s?(\d{2})\s?\-?\s?(\d{2})/
    if let result = try? search.wholeMatch(in: phoneNumber) {
        return (String(result.1), String(result.2), String(result.3+result.4+result.5))
    }
    return nil
}

//Test
print("------------task 7------------")
print(phoneNumberComponents("375336332955"))
print(phoneNumberComponentsRegex("+375448540011") ?? "Invalid number format")
print(phoneNumberComponentsRegex("+375(44)8540012") ?? "Invalid number format")
print(phoneNumberComponentsRegex("+375 (44) 854 00 13") ?? "Invalid number format")
print(phoneNumberComponentsRegex("+ 375 (44) 854 00 14") ?? "Invalid number format")
print(phoneNumberComponentsRegex("+375-(44)-854-00-15") ?? "Invalid number format")
print(phoneNumberComponentsRegex("+375-44-8540016") ?? "Invalid number format")
print(phoneNumberComponentsRegex("+375(44)854-00-17") ?? "Invalid number format")
print(phoneNumberComponentsRegex("37529233") ?? "Invalid number format")
print(phoneNumberComponentsRegex(" eqeeq ") ?? "Invalid number format")

// MARK: -8*. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую
//true, если оно простое, и false, если сложное. Рекомендую попробовать решать рекурсией, чтобы разобраться как она работает.

func isSimpleNumber(_ number: Int, _ divisor: Int = 2) -> Bool? {
    guard number >= 0 && number <= 100 else {
        print("Number is not included in the range from 0 to 100")
        return nil
    }
    
    guard number < 2 else {
        print("The numbers 0 and 1 are neither prime nor composite")
        return nil
    }
    
    if number == divisor {
        return true
    } else if number % divisor == 0 {
        return false
    }
    return isSimpleNumber(number, divisor + 1)
}

//Test
print("------------task 8*------------")
print(isSimpleNumber(0) ?? "Error")
print(isSimpleNumber(5) ?? "Error")
print(isSimpleNumber(10) ?? "Error")
print(isSimpleNumber(101) ?? "Error")

// MARK: -9*. Создать функцию, которая считает факториал введённого числа.

func  factorial(_ num: Int) -> Int? {
    guard num >= 0 else {
        print("Factorial is not defined for negative numbers")
        return nil
    }
    
    if num == 0 || num == 1 {
        return 1
    }
    
    if let unwrapFunc = factorial(num - 1) {
        return num * unwrapFunc
    }
    
    return nil
}

//Test
print("------------task 9*------------")
print(factorial(5) ?? 0)
print(factorial(10) ?? 0)
print(factorial(-5) ?? 0)

// MARK: -10*. Создать функцию, которая выводит все числа последовательности Фибоначчи
//до введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8

func fibonacciTable(n: Int) -> [Int] {
    guard n >= 0 else {
        print("fibonacciTable is not defined for negative numbers")
        return []
    }
    
    var result: [Int] = [0, 1]
    
    if n == 1 || n == 2{
        return n == 1 ? [0] : [0, 1]
    }
    
    for i in 2..<n {
        result.append(result[i-2] + result[i-1])
    }
    return result
}

//Test
print("------------task 10*------------")
print (fibonacciTable(n: -1))
print (fibonacciTable(n: 1))
print (fibonacciTable(n: 2))
print (fibonacciTable(n: 5))
print (fibonacciTable(n: 10))

// MARK: -11*. Создать функцию, которая считает сумму цифр четырехзначного числа,
//переданного в параметры функции (Int).

func sumOfDigits(number: Int) -> Int {
    guard number >= 1000 && number <= 9999 else {
        print("sumOfDigits is not defined for numbers not in range 1000..<9999")
        return -1
    }
    return (number / 1000) + (number % 1000) / 100 + (number % 100) / 10 + number % 10
}

//Test
print("------------task 11*------------")
print(sumOfDigits(number: 8921))
print(sumOfDigits(number: 1111))
print(sumOfDigits(number: 0000))
print(sumOfDigits(number: 111))
