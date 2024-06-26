//
//  main.swift
//  lab4.1
//
//  Created by misha on 29.05.2022.
//
/*    --------------------------------------------------------    */
// Функции главного меню
/** Функция выбора действий программы пользователем */
func mainMenu() -> Int {
    print("\n ***   Главное Меню    ***\n")
    print(" Выберите номер действия из меню:")
    print (" 🟢(1) Вывод значений аргумента и заданной функции F(x)\n       с шагом 0.01 на промежутке [-3 , 3]")
    print (" 🟢(2) Вывод корней уравнения F(x) = 0, \n       вычесленных методом дихотомии с точностью 0.0001")
    print (" 🟢(3) Вывод количества экстремумов функции F(x)")
    print (" 🟢(4) Вывод интеграла функции,\n       вычесленного методом прямоугольников с точностью 0.001\n       на отрезке между вторым и третьим корнями функции")
    print (" 🟢(5) Вывод интеграла функции,\n       вычесленного методом трапеций с точностью 0.001\n       на отрезке между вторым и третьим корнями функции")
    print (" 🟢(6) Вывод интеграла функции,\n       вычесленного методом Монте-Карло\n       на отрезке между вторым и третьим корнями функции,\n       задав не менее 100 точек для усреднения значения интеграла.")
    print (" 🟢(7) Вывод интегралов функции,\n       вычесленных всеми тремя методами\n       на отрезке между вторым и третьим корнями функции")
    print (" 🟡(8) Изменить параметр функции N")
    print (" 🔴(9) Выход (завершение работы программы) \n")
    return enterNumberUnsignedInt()
}
/** Функция ввода параметра N */
func enter_N() {
    repeat{
        print(" Введите параметр функции N\n от 1 до 5 включительно")
        N = Optional (enterNumberUnsignedInt())
        
        if N! < 1 || N! > 5 {
            print(" ⚠️ Внимание: Нужно ввести число от 1 до 5 включительно!")
            N = nil
        }
    } while N == nil // если ввод не удался, просим ввести снова
}
/** Функция приветствия пользователя */
func  helloUser() {
    print("\n Hello, Lab 4! \n  \n Вариант N12")
    print(" Это программа, которая выполняет приведенные в меню\n операции над математической функцией в заданном\n интервале значений аргумента\n")
    shellCommandStart( labName: "lab4.1") //  функция отображения выражения с которым работает программа
}
/** Функция завершения работы программы */
func goodByeUser() {
    print("\n До свидания, возвращайтесь ещё!")
    shellCommandStop() // функция завершения отображения выражения с которым работает программа
    print(" ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")
}
/*    ------------ Сама программа, по сути main() ------------    */
import Foundation
var N:Int? // параметр математической функции
private var resume: Bool = true // флаг продолжать ли работу программы
public let  limit_a = -3.0
public let  limit_b = 3.0
public let  H = 0.01 // шаг
public var roots: [Double] // массив корней функции

helloUser() // приветсвие пользователя, основная информация о программе
enter_N() // ввод параметра N
findRootsDichotomyMethod() // поиск корней и инициализация массива корней для интегралов
/* -------- Блок меню --------- */
repeat{
    switch mainMenu() {
    case 1:
        print (" 🟢 Вывод значений аргумента и заданной функции F(x) с шагом 0.01 в промежутке [-3 , 3]")
        print()
        funcValuesOnSegment()
    case 2:
        print (" 🟢 Вывод корней уравнения F(x) = 0 методом дихотомии с точностью 0.0001")
        print()
        showRootsDichotomyMethod()
    case 3:
        print (" 🟢 Вывод количества экстремумов функции F(x)")
        print()
        countExtrema()
    case 4:
        print (" 🟢 Вывод интеграла функции,\n    вычесленного методом прямоугольников с точностью 0.001\n    на отрезке между вторым и третьим корнями функции")
        print()
        findRootsDichotomyMethod()
        rectanglesIntegrationMethod()
    case 5:
        print (" 🟢 Вывод интеграла функции,\n    вычесленного методом трапеций с точностью 0.001\n    на отрезке между вторым и третьим корнями функции")
        print()
        findRootsDichotomyMethod()
        trapeziumIntegrationMethod()
    case 6:
        print (" 🟢 Вывод интеграла функции,\n    вычесленного методом Монте-Карло\n    на отрезке между вторым и третьим корнями функции,\n    задав не менее 100 точек для усреднения значения интеграла")
        findRootsDichotomyMethod()
        monteCarloIntegrationMethod()
    case 7:
        print (" 🟢 Вывод интегралов функции,\n    вычесленных всеми тремя методами\n    на отрезке между вторым и третьим корнями функции")
        findRootsDichotomyMethod()
        monteCarloIntegrationMethod()
        print()
        rectanglesIntegrationMethod()
        print()
        trapeziumIntegrationMethod()
    case 8:
        print (" 🟡 Изменить параметр функии N \n")
        enter_N() // ввод параметра N
    case 9:
        resume = false
        goodByeUser() // выход - завершение программы
    default:
        print(" ⚠️ Внимание: Нужно ввести число от 1 до 9!")
    }
} while resume
/*    ---------------------------------------    */
