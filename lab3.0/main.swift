//
//  main.swift
//  lab 3.0
//  Created by misha borisov on 15.04.2022.
//
/*    ---------------------------------------    */
// функции меню параметров
// функция выбора пользователем какой параметр он задает
func sizeMenu() -> Int {
    print("\n *** Меню задания параметров ***\n")
    print(" Выберите номер действия из меню:")
    print(" 🟢(1) Задать Цилиндр целиком")
    print(" 🟢(2) Задать Высоту1 (h1)")
    print(" 🟢(3) Задать Высоту2 (h2)")
    print(" 🟢(4) Задать Радиус (R)")
    print(" 🟡(5) Выход в главное меню\n")
    return enterNumberUnsignedInt()
}
// функция задания параметров цилиндра
func mainMenuSetSize(cylinder: Cylinder) {
     switch sizeMenu() {
     case 1:
        // задать цилиндр целиком
        print("\n *** Задание вашего цилиндра целиком ***")
        cylinder.setHeight1() // задать высоту1
        cylinder.setHeight2() // задать высоту2
        cylinder.setRadius() // задать радиус
        cylinder.showParameters() // показать параметры цилиндра
     case 2:
        cylinder.setHeight1() // задать высоту1
     case 3:
        cylinder.setHeight2() // задать высоту2
     case 4:
        cylinder.setRadius() // задать радиус
     case 5:
        break // выход в главное меню
     default:
         print(" ⚠️ Внимание: Нужно ввести число от 1 до 5!")
     }
}
/*    ---------------------------------------    */
// функции главного меню
// функция выбора действий программы пользователем
func mainMenu() -> Int {
    print("\n ***   Главное Меню    ***\n")
    print(" Выберите номер действия из меню:")
    print (" 🟢(1) Calculate the value of the function in the range[0.6] with a step of 0.01")
    print (" 🟢(2) Calculate the roots of the equation F(x) using the dichtomy method")
    print (" 🟢(3) Output the number of extrema of the function F(x)")
    print (" 🟢(4) Calculation of the integral of a function by the method of rectangles")
    print (" 🟢(5) Calculation of the integral of a function by the trapezoid method - не работает")
    print (" 🟢(6) Calculation of the integral of a function by the Monte Carlo method - не работает")
    print (" 🔴(7) Выход (завершение программы)\n")
    return enterNumberUnsignedInt()
}
/*    ---------------------------------------    */
// функция приветствия пользователя
func  helloUser() {
    print("\n Hello, Lab 3! \n  \n Вариант N2")
    print(" Это программа позволяющая многократно вычислять объём усечённого цилиндра и \n одновременно менять значения параметров формулы.")
    
    shellCommandStart( labName: "lab3.0") //  функция отображения выражения с которым работает программа
    Cylinder.shellCommandStartCylinder(labName: "lab3.0") // функция отображения изображения цилиндра
}
// функция завершения работы программы
func goodByeUser() {
    print("\n Досвидания, возвращайтесь ещё!")
    shellCommandStop() // функция завершения отображения выражения с которым работает программа
    print(" ", terminator: "") // terminator - параметр того, что будет после печати, по умолчанию используется новая строка ("\n")
}
/*    ---------------------------------------    */
// сама программа, по сути main
import Foundation // фреймворк - куча библиотек и вспомогательные программы, в отличие от библиотеки диктует правила построения архтитектуры приложения
helloUser() // приветсвие пользователя, основная информация о программе
private var resume: Bool = true // продолжать ли
private let userCylinder: Cylinder = Cylinder()! // объявление и инициализция конструктором без параметров объекта класса цилиндр
//private let userCylinder: Cylinder = Cylinder(radius: 1,height1: 4,height2: 3)! // объявление и инициализция конструктором без параметров объекта класса цилиндр
repeat
{
    switch mainMenu() {
    case 1:
        userCylinder.showParameters() // показать параметры цилиндра
    case 2:
        mainMenuSetSize(cylinder: userCylinder) // установить параметры цилиндра
    case 3:
        userCylinder.showVolume() // посчиать объём цилиндра
    case 4:
        userCylinder.showSectionSquare() // посчитать площадь сечения цилиндра
    case 5:
        resume = false
        goodByeUser() // выход - завершение программы
    default:
        print(" ⚠️ Внимание: Нужно ввести число от 1 до 5!")
    }
}
while resume
/*    ---------------------------------------    */
