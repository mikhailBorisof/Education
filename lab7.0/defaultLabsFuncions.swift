//
//  defaultFunc.swift
//  
//  Created by misha borisov on 19.04.2022.
//  Updated by misha borisov on 17.05.2022.
//
import Foundation
/*    ------------- Функции ввода пользователем чисел в консоль -------------    */
/**
 Функция обрабатывает ввод пользователя и возвращает введенное им НЕОТРИЦАТЕЛЬНОЕ число типа Int
 - Warning: Максимальная длина, вводимого пользователем числа: 20
 - Warning: Позволяет вводить только НЕОТРИЦАТЕЛЬНЫЕ целые числа
 - Warning: Позволяет вводить ноль 
 - Returns: Ввод пользователя. В случае ошибки предоставляет возможность ввести число еще раз
 */
func enterNumberUnsignedInt() -> Int {
    var answer:String // ввод пользователя
    var isDataPerfect: Bool // флаг нравится ли нам вводимая строка
    // переменная для записи Ascii кода символа
    var temp: UInt8 // целочисленный беззнаковый тип занимающий 8 бит, можно записать [0,255], то есть 2 в восьмой чисел
    var index:Int // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу

  repeat{
        isDataPerfect = true
        //print("\nВведите целое число")
        print(" Введите число: ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")

        answer = readLine()! // читает поток ввода и создает обьект типа Optional<String>
        
        // если если слишком длинный ввод
        if answer.count > 20 {
            print(" ⚠️ Внимание: Ввод значения не может превышать 20 символов!")
            if answer.count % 10 == 1 && answer.count != 11 {
                print(" Вы ввели \(answer.count) символ")
            }
            else{
                if 1 < answer.count % 10 && answer.count % 10 < 5  && answer.count != 12 && answer.count != 13 && answer.count != 14{
                    print(" Вы ввели \(answer.count) символа")
                }
                else{
                    print(" Вы ввели \(answer.count) символов")
                }
            }
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
        /*    ---------------------------------------    */
        // если содержит что-то кроме нужных нам символов 0123456789 -  48-57 || 32 - еще пробел
        temp = 0 // переменная для записи Ascii кода символа
        index = 0 // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу
        for char in answer {
            index += 1
            if(char.asciiValue != nil) {
                temp = char.asciiValue!
                // если неподходящий нам знак
                if !( 48 <= temp && temp <= 57 || temp == 32 ) {
                    print(" ⚠️ Внимание: Вводить можно только положительные целые числа")
                    print(" Без точек и запятых")
                    isDataPerfect = false
                    break /* выход из цикла */
                }
            }
            else {
                isDataPerfect = false
                print(" ⚠️ Внимание: Вводить можно только положительные целые числа!")
                break /* выход из цикла */
            }
        }
        // если написали число с пробелами
        if answer.contains(" ") {
            answer = answer.replacingOccurrences(of: " ", with: "") // заменяет появления (of) в строке 
        }
        // если слишком короткий ввод
        if answer.count < 1 {
            print(" ⚠️ Внимание: Вы вообще ничего не ввели !")
            print(" Попробуйте еще раз, у вас получится !")
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
        if isDataPerfect && Double(answer) == nil {
            print(" 🛑 Ошибка: Неожиданная ошибка функции ввода")
        }
    }
    while !isDataPerfect // продолжаем в случае плохих данных

    // убираем минус перед нулем
    if Double(answer)! == 0 && answer.contains("-") {
        answer = answer.replacingOccurrences(of: "-", with: "")
    }
    print(" 🟢 Ваше число: \(Int(answer)! )")
    return Int(answer)! // передаем данные дальше, в виде типа Double
}
/**
 Функция обрабатывает ввод пользователя и возвращает введенное им НЕОТРИЦАТЕЛЬНОЕ число типа Double
 - Warning: Максимальная длина, вводимого пользователем числа: 20
 - Warning: Позволяет вводить только НЕОТРИЦАТЕЛЬНЫЕ целые числа
 - Warning: Позволяет вводить ноль
 - Returns: Ввод пользователя. В случае ошибки предоставляет возможность ввести число еще раз
 */
func enterNumberUnsignedDoubleWithZero() -> Double {
    var answer:String // ввод пользователя
    var isDataPerfect: Bool // флаг нравится ли нам вводимая строка
    // переменная для записи Ascii кода символа
    var temp: UInt8 // целочисленный беззнаковый тип занимающий 8 бит, можно записать [0,255], то есть 2 в восьмой чисел
    var povtor:Int // количество повторов запятой и точки в строке
    var index:Int // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу

    repeat{
        isDataPerfect = true
        print(" Введите число: ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")

        answer = readLine()! // читает поток ввода и создает обьект типа Optional<String>
        
        // если если слишком длинный ввод
        if answer.count > 20 {
            print(" ⚠️ Внимание: Ввод значения не может превышать 20 символов!")
            if answer.count % 10 == 1 && answer.count != 11 {
                print(" Вы ввели \(answer.count) символ")
            }
            else{
                if 1 < answer.count % 10 && answer.count % 10 < 5  && answer.count != 12 && answer.count != 13 && answer.count != 14{
                    print(" Вы ввели \(answer.count) символа")
                }
                else{
                    print(" Вы ввели \(answer.count) символов")
                }
            }
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
        /*    ---------------------------------------    */
        // если содержит что-то кроме нужных нам символов 0123456789 -  48-57 || 44 - , 46 - .) || еще пробел
        temp = 0 // переменная для записи Ascii кода символа
        povtor = 0 // количество повторов запятой и точки в строке
        index = 0 // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу
        for char in answer {
            index += 1
            if(char.asciiValue != nil) {
                temp = char.asciiValue!
                // если неподходящий нам знак
                if !(temp != 47 && 46 <= temp && temp <= 57 || temp == 32 || temp == 44) {
                    print(" ⚠️ Внимание: Вводить можно только положительные числа и знаки:  '.' , ',' ")
                    isDataPerfect = false
                    break /* выход из цикла */
                }
                // точки и запятые не должны повторятся
                if temp == 44 || temp == 46 { povtor += 1 }
            }
            else {
                isDataPerfect = false
                print(" ⚠️ Внимание: Вводить можно только положительные числа и знаки: '.' , ',' !")
                break /* выход из цикла */
            }
            // если ввели только . , - то добавим им ноль
            if answer.count == 1 && ( temp == 44 || temp == 46){ answer.append("0")}
            // точки и запятые не должны повторятся больше одного раза
            if povtor > 1 {
                print(" ⚠️ Внимание: Можно ввести только одну запятую или точку!")
                print(" Попробуйте еще раз, у вас получится!")
                isDataPerfect = false
                continue /* переход на следующую итерацию тела цикла без
                 выполнения тела цикла */
            }
        }
        // если написали число через запятую
        if answer.contains(",") {
            answer = answer.replacingOccurrences(of: ",", with: ".")
        }
        // если написали число с пробелами
        if answer.contains(" ") {
            answer = answer.replacingOccurrences(of: " ", with: "")
        }
        // если слишком короткий ввод
        if answer.count < 1 {
            print(" ⚠️ Внимание: Вы вообще ничего не ввели !")
            print(" Попробуйте еще раз, у вас получится !")
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
        if isDataPerfect && Double(answer) == nil {
            print(" 🛑 Ошибка: Неожиданная ошибка функции ввода")
        }
    }
    while !isDataPerfect // продолжаем в случае плохих данных

    print(" 🟢 Ваше число: \(Double(answer)! )")
    return Double(answer)! // передаем данные дальше, в виде типа Double
}
/**
Функция обрабатывает ввод пользователя и возвращает введенное им ПОЛОЖИТЕЛЬНОЕ число типа Double
- Warning: Максимальная длина, вводимого пользователем числа: 20
- Warning: Позволяет вводить только ПОЛОЖИТЕЛЬНЫЕ целые числа
- Warning: НЕ Позволяет вводить ноль
- Returns: Ввод пользователя. В случае ошибки предоставляет возможность ввести число еще раз
*/
func enterNumberUnsignedDoubleNoZero() -> Double {
   var answer:String // ввод пользователя
   var isDataPerfect: Bool // флаг нравится ли нам вводимая строка
   // переменная для записи Ascii кода символа
   var temp: UInt8 // целочисленный беззнаковый тип занимающий 8 бит, можно записать [0,255], то есть 2 в восьмой чисел
   var povtor:Int // количество повторов запятой и точки в строке
   var index:Int // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу

   repeat{
       isDataPerfect = true
       print(" Введите число: ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")

       answer = readLine()! // читает поток ввода и создает обьект типа Optional<String>
       
       // если если слишком длинный ввод
       if answer.count > 20 {
           print(" ⚠️ Внимание: Ввод значения не может превышать 20 символов!")
           if answer.count % 10 == 1 && answer.count != 11 {
               print(" Вы ввели \(answer.count) символ")
           }
           else{
               if 1 < answer.count % 10 && answer.count % 10 < 5  && answer.count != 12 && answer.count != 13 && answer.count != 14{
                   print(" Вы ввели \(answer.count) символа")
               }
               else{
                   print(" Вы ввели \(answer.count) символов")
               }
           }
           isDataPerfect = false
           continue /* переход на следующую итерацию тела цикла без
            выполнения тела цикла */
       }
       /*    ---------------------------------------    */
       // если содержит что-то кроме нужных нам символов 0123456789 -  48-57 || 44 - , 46 - .) || еще пробел
       temp = 0 // переменная для записи Ascii кода символа
       povtor = 0 // количество повторов запятой и точки в строке
       index = 0 // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу
       for char in answer {
           index += 1
           if(char.asciiValue != nil) {
               temp = char.asciiValue!
               // если неподходящий нам знак
               if !(temp != 47 && 46 <= temp && temp <= 57 || temp == 32 || temp == 44) {
                   print(" ⚠️ Внимание: Вводить можно только положительные числа и знаки:  '.' , ',' ")
                   isDataPerfect = false
                   break /* выход из цикла */
               }
               // точки и запятые не должны повторятся
               if temp == 44 || temp == 46 { povtor += 1 }
           }
           else {
               isDataPerfect = false
               print(" ⚠️ Внимание: Вводить можно только положительные числа и знаки: '.' , ',' !")
               break /* выход из цикла */
           }
           // если ввели только . , - то добавим им ноль
           if answer.count == 1 && ( temp == 44 || temp == 46){ answer.append("0")}
           // точки и запятые не должны повторятся больше одного раза
           if povtor > 1 {
               print(" ⚠️ Внимание: Можно ввести только одну запятую или точку!")
               print(" Попробуйте еще раз, у вас получится!")
               isDataPerfect = false
               continue /* переход на следующую итерацию тела цикла без
                выполнения тела цикла */
           }
       }
       // если написали число через запятую
       if answer.contains(",") {
           answer = answer.replacingOccurrences(of: ",", with: ".")
       }
       // если написали число с пробелами
       if answer.contains(" ") {
           answer = answer.replacingOccurrences(of: " ", with: "")
       }
       // если слишком короткий ввод
       if answer.count < 1 {
           print(" ⚠️ Внимание: Вы вообще ничего не ввели !")
           print(" Попробуйте еще раз, у вас получится !")
           isDataPerfect = false
           continue /* переход на следующую итерацию тела цикла без
            выполнения тела цикла */
        }
        if isDataPerfect && Double(answer) == nil {
            print(" 🛑 Ошибка: Неожиданная ошибка функции ввода")
        }
        // если ввели ноль
        if isDataPerfect && Double(answer)! == 0 {
            print(" ⚠️ Внимание: Нельзя задать параметр равный нулю !")
            print(" Попробуйте еще раз, у вас получится !")
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
            выполнения тела цикла */
        }
   }
   while !isDataPerfect // продолжаем в случае плохих данных

   print(" 🟢 Ваше число: \(Double(answer)! )")
   return Double(answer)! // передаем данные дальше, в виде типа Double
}
/**
Функция обрабатывает ввод пользователя и возвращает введенное им число типа Double
- Warning: Максимальная длина, вводимого пользователем числа: 20
- Warning: Позволяет вводить ноль
- Returns: Ввод пользователя, в случае ошибки предоставляет возможность ввести число еще раз
*/
func enterNumberDouble() -> Double {
   var answer:String // ввод пользователя
   var isDataPerfect: Bool // флаг нравится ли нам вводимая строка
   // переменная для записи Ascii кода символа
   var temp: UInt8 // целочисленный беззнаковый тип занимающий 8 бит, можно записать [0,255], то есть 2 в восьмой чисел
   var povtor:Int // количество повторов запятой и точки в строке
   var index:Int // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу

   repeat{
       isDataPerfect = true
       print(" Введите число: ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")

       answer = readLine()! // читает поток ввода и создает обьект типа Optional<String>
       
       // если если слишком длинный ввод
       if answer.count > 20 {
           print(" ⚠️ Внимание: Ввод значения не может превышать 15 символов!")
           if answer.count % 10 == 1 && answer.count != 11 {
               print(" Вы ввели \(answer.count) символ")
           }
           else{
               if 1 < answer.count % 10 && answer.count % 10 < 5  && answer.count != 12 && answer.count != 13 && answer.count != 14{
                   print(" Вы ввели \(answer.count) символа")
               }
               else{
                   print(" Вы ввели \(answer.count) символов")
               }
           }
           isDataPerfect = false
           continue /* переход на следующую итерацию тела цикла без
            выполнения тела цикла */
       }
       /*    ---------------------------------------    */
       // если содержит что-то кроме нужных нам символов 0123456789 -  48-57 || 44-46 (, - .) || еще пробел
       temp = 0 // переменная для записи Ascii кода символа
       povtor = 0 // количество повторов запятой и точки в строке
       index = 0 // индекс символа в строке, так как в swift нельзя обратиться к символу по индексу
       for char in answer {
           index += 1
           if(char.asciiValue != nil) {
               temp = char.asciiValue!
               // если неподходящий нам знак
               if !(temp != 47 && 44 <= temp && temp <= 57 || temp == 32) {
                   print(" ⚠️ Внимание: Вводить можно только числа и знаки: '-' , '.' , ',' ")
                   isDataPerfect = false
                   break /* выход из цикла */
               }
               // точки и запятые не должны повторятся
               if temp == 44 || temp == 46 { povtor += 1 }
               // если дефис не на первом месте
               if temp == 45 && index > 1 {
                   print(" ⚠️ Внимание: Символ '-' должен стоять в начале строки и не должен повторяться")
                   isDataPerfect = false
                   break /* выход из цикла */
               }
           }
           else {
               isDataPerfect = false
               print(" ⚠️ Внимание: Вводить можно только числа и знаки: '-' , '.' , ',' !")
               break /* выход из цикла */
           }
           // если ввели только . , - то добавим им ноль
           if answer.count == 1 && (temp == 45 || temp == 44 || temp == 46){ answer.append("0")}
           // точки и запятые не должны повторятся больше одного раза
           if povtor > 1 {
               print(" ⚠️ Внимание: Можно ввести только одну запятую или точку!")
               print(" Попробуйте еще раз, у вас получится!")
               isDataPerfect = false
               continue /* переход на следующую итерацию тела цикла без
                выполнения тела цикла */
           }
       }
       // если написали число через запятую
       if answer.contains(",") {
           answer = answer.replacingOccurrences(of: ",", with: ".")
       }
       // если написали число с пробелами
       if answer.contains(" ") {
           answer = answer.replacingOccurrences(of: " ", with: "")
       }
       // если слишком короткий ввод
       if answer.count < 1 {
           print(" ⚠️ Внимание: Вы вообще ничего не ввели !")
           print(" Попробуйте еще раз, у вас получится !")
           isDataPerfect = false
           continue /* переход на следующую итерацию тела цикла без
            выполнения тела цикла */
       }
       if isDataPerfect && Double(answer) == nil {
           print(" 🛑 Ошибка: Неожиданная ошибка функции ввода")
       }
   }
   while !isDataPerfect // продолжаем в случае плохих данных

   // убираем минус перед нулем
   if Double(answer)! == 0 && answer.contains("-") {
       answer = answer.replacingOccurrences(of: "-", with: "")
   }
   print(" 🟢 Ваше число: \(Double(answer)! )")
   return Double(answer)! // передаем данные дальше, в виде типа Double
}
/*    ------------ Функции запуска и завершения отображения фотографий -------------    */
/**
 Функция запуска отображения выражения с которым работает программа
 - Parameters:
    - labName: Имя папки лабораторной работы
 - Throws: Выдает ошибку при отсутствии файла
 */
func shellCommandStart (labName:String) {
    let task = Process() // обьект позволяющий запускать другую программу в качестве подпроцесса (подпрогрмаммы, имеет свои потоки ввода вывода и потоки ошибок
    task.launchPath = "/usr/bin/open" // путь к исполняемому файлу, который мы хотим запустить
    task.arguments = ["/Users/mishamisha/myProgramms/labsFtiSem4/\(labName)/\(labName)/expressionPhoto\(labName).png"] // аргументы команды, которые система использует для запуска исполняемого файла
    
    task.launch() // запускает подпроцесс
    task.waitUntilExit() // передает управление потоками родителю и проверяет работает ли до сих пор родитель
}
/**
 Функция завершения отображения выражения с которым работает программа
 - Warning: Закрывает у пользователя все окна приложения просмотр
 */
func shellCommandStop() {
    let photoHideProcess = Process() // обьект позволяющий запускать другую программу в качестве подпроцесса (подпрогрмаммы), имеет свои потоки ввода вывода и потоки ошибок
    photoHideProcess.launchPath = "/usr/bin/killall" // путь к исполняемому файлу, который мы хотим запустить
    photoHideProcess.arguments = ["Preview"] // аргументы команды, которые система использует для запуска исполняемого файла

    photoHideProcess.launch() // запускает подпроцесс
    photoHideProcess.waitUntilExit() // передает управление потоками родителю и проверяет работает ли до сих пор родитель
}
/*    --------------------------    */
/**
 Функция выбора пользователем продолжать ли работу программы
 - Returns: true or false. True-готов продолжить, False-не готов продолжить  , в случае ошибки предоставляет возможность ввести ответ еще раз
 */
func isRepiat() -> Bool {
    var answer:String // ввод пользователя
    var isDataPerfect: Bool // флаг нравится ли нам вводимая строка
    repeat{
        isDataPerfect = true
        print("\n Хотите запустить программу еще раз ?")
        print(" 🟢(1) Да")
        print(" 🔴(0) Нет")
        print(" Введите число: ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")
        answer = readLine()! // читает поток ввода и создает обьект типа Optional<String>
        
        // если если слишком короткий ввод
        if answer.count < 1 {
            print(" ⚠️ Внимание: Вы вообще ничего не ввели !!!")
            print(" Напоминаю, нужно число 1 или 0!")
            print(" Попробуйте еще раз, у вас получится!")
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
        // если если слишком длинный ввод, еще тут выбор правильной формы слова символ
        if answer.count > 1 {
            print(" ⚠️ Внимание: Ввод чисел 1 и 0 содержит явно меньше символов, чем вы ввели")
            if answer.count % 10 == 1 && answer.count != 11 {
                print(" Вы ввели \(answer.count) символ")
            }
            else{
                if 1 < answer.count % 10 && answer.count % 10 < 5  && answer.count != 12 && answer.count != 13 && answer.count != 14{
                    print(" Вы ввели \(answer.count) символа")
                }
                else{
                    print(" Вы ввели \(answer.count) символов")
                }
            }
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
        // если не содержит ни того ни другого
        if !answer.contains("1") && !answer.contains("0") {
            print(" ⚠️ Внимание: Нужно число 1 или 0!")
            print(" Попробуйте еще раз, у вас получится!")
            isDataPerfect = false
            continue /* переход на следующую итерацию тела цикла без
             выполнения тела цикла */
        }
    }
    while !isDataPerfect // продолжаем в случае плохих данных || ! - оператор не

    print()
    return Bool( truncating: Int(answer)! as NSNumber) // ! - оператор обращения к значению функционала || as - для восходящего преобразования типов || NSNumber - класс обертка для всех численных типов имеющий методы сравнения || truncating - парметр инициализации , для выбора конструктора || Bool() явное преобразование to Bool || return возврат значения из функции
}
/*    --------------------------    */
