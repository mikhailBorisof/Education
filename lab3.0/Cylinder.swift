//
//  Cylinder.swift
//  lab3.0
//  Created by misha borisov on 20.04.2022.

// Теория: уровни доступа в языке Swift
/*
     Публичный (public access). Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из определяющего их модуля и так же в любом исходном файле из другого модуля, который импортирует определяющий модуль.
     Внутренний (internal access). Этот уровень доступа позволяет использовать объекты внутри любого исходного файла из их определяющего модуля, но не исходного файла не из этого модуля. (фреймворк - это модуль) (установлен по дефолту)
     Файл-частный (file private). Этот уровень доступа позволяет использовать объект в пределах его исходного файла.
     Частный (private). Этот уровень доступа позволяет использовать сущность только в пределах области ее реализации.
 */

import Foundation
class Cylinder {
    // для удовлетворения принципа инкапсуляции
    // закрытые члены класса (переменные) ( хранимые свойства класса )
    private var radiusValue: Double?, height1Value: Double?,height2Value: Double?
    // вычисляемое свойство для доступа к переменной radiusValue
    var radius: Double? {
        get{ return radiusValue }
        set{
            if newValue! > 0 { radiusValue = newValue }
            else { print(" ⚠️ Внимание: Параметр радиус должен быть больше нуля") }
        }
    }
    // вычисляемое свойство для доступа к переменной height1Value
    var height1: Double? {
        get{ return height1Value }
        set{
            if newValue! > 0 { height1Value = newValue }
            else { print(" ⚠️ Внимание: Параметр высота1 должен быть больше нуля") }
        }
    }
    // вычисляемое свойство для доступа к переменной height2Value
    var height2: Double? {
        get{ return height2Value }
        set{
            if newValue! > 0 { height2Value = newValue }
            else { print(" ⚠️ Внимание: Параметр высота2 должен быть больше нуля") }
        }
    }
    // метод задания радиуса цилиндра
    func setRadius() {
        print("\n *** Задание радиуса вашего цилиндра ***\n")
        radius = enterNumberUnsignedDoubleNoZero() // измененям значение парметра в самом объекте цилиндр
        if radius != nil { print(" 🟢 Радиус: \(radius!)") }
        else { print( " 🟡 Радиус вашего цилиндра не задан") }
    }
    // метод задания высоты1 цилиндра
    func setHeight1() {
        print("\n *** Задание высоты1 вашего цилиндра ***\n")
        height1 = enterNumberUnsignedDoubleNoZero() // измененям значение парметра в самом объекте цилиндр
        if height1 != nil { print(" 🟢 Высота1: \(height1!)") }
        else { print( " 🟡 Высота1 вашего цилиндра не задана") }
    }
    // метод задания высоты2 цилиндра
    func setHeight2() {
        print("\n *** Задание высоты2 вашего цилиндра ***\n")
        height2 = enterNumberUnsignedDoubleNoZero() // измененям значение парметра в самом объекте цилиндр
        if height2 != nil { print(" 🟢 Высота2: \(height2!)") }
        else { print( " 🟡 Высота2 вашего цилиндра не задана") }
    }
    /*    ---------------------------------------    */
    // вычисляемое свойство объем цилиндра
    var Volume: Double? {
        if radius == nil || height1 == nil || height2 == nil { return nil }
        return Double.pi * radius! * radius! * (height2! + height1! ) / 2
    }
    // вычисляемое свойство площадь сечения цилиндра
    var sectionSquare: Double? {
        if radius == nil || height1 == nil || height2 == nil { return nil }
        return Double.pi * radius! * largerDiameter!/2 // площадь сечения
    }
    // вычисляемое свойство бо'льший диаметр сечения цилиндра
    var largerDiameter: Double? {
        if radius == nil || height1 == nil || height2 == nil { print("Цилиндр не задан"); return nil }
        if height2 == height1 { return 2 * radius! } // если чечение - окружность
        return sqrt(4 * pow(radius!,2) + pow(height2! - height1!, 2) ) // по теореме пифагора
    }
    /*    ---------------------------------------    */
    // метод отображения объёма цилиндра
    func showVolume() {
        print("\n *** Объём вашего цилиндра ***\n")
        if Volume == nil { print(" 🟡 Цилиндр не задан") }
        else { print(" 🟢 Объём цилиндра: \(NSString(format:"%.3f", Volume! ))") }
    }
    // метод отображения площади сечения цилиндра
    func showSectionSquare() {
        print("\n *** Площадь сечения вашего цилиндра ***\n")
        if sectionSquare == nil { print(" 🟡 Цилиндр не задан") }
        else { print(" 🟢 Площадь сечения цилиндра: \(NSString(format:"%.3f", sectionSquare! ))") }
    }
    // метод отображения параметров цилиндра
    func showParameters() {
        print("\n *** Параметры вашего цилиндра ***\n")
        if height1 != nil { print( " 🟢 Высота1: \(height1!)") }
        else { print( " 🟡 Высота1 вашего цилиндра не задана") }
        if height2 != nil { print( " 🟢 Высота2: \(height2!)") }
        else { print( " 🟡 Высота2 вашего цилиндра не задана") }
        if radius != nil { print( " 🟢 Радиус: \(radius!)") }
        else { print( " 🟡 Радиус вашего цилиндра не задан") }
    }
    /*    ---------------------------------------    */
    // конструктор без параметров
    init? () {
    radiusValue = nil; height1Value = nil; height2Value = nil
    }
    // конструктор с параметрами
    init? (radius radiusValue:Double, height1 height1Value:Double, height2 height2Value:Double) { //  ? Специальная разновидность инициализаторов (Failable Initializer) позволяет возвратить значение nil, если в процессе инициализации объекта произошла какая-нибудь ошибка
        // внешнее_имя_параметра внутреннее_имя_параметра : тип_данных_параметра
        if radiusValue < 0 || height1Value < 0 || height2Value < 0 {
            print(" ⚠️ Внимание: Нельзя создать цилиндр с отрицательными характеристиками")
            return nil
        }
        self.radiusValue = radiusValue
        self.height1Value = height1Value
        self.height2Value = height2Value
    }
    /*    ---------------------------------------    */
    // метод открывающий для пользователя, то как выглядит усеченный цилиндр
    static func shellCommandStartCylinder (labName:String) {
        let task = Process() // обьект позволяющий запускать другую программу в качестве подпроцесса (подпрогрмаммы, имеет свои потоки ввода вывода и потоки ошибок
        task.launchPath = "/usr/bin/open" // путь к исполняемому файлу, который мы хотим запустить
        task.arguments = ["/Users/mishamisha/myProgramms/labsFtiSem4/\(labName)/\(labName)/truncatedСylinder.jpeg"] // аргументы команды, которые система использует для запуска исполняемого файла
        task.launch() // запускает подпроцесс
        task.waitUntilExit() // передает управление потоками родителю и проверяет работает ли до сих пор родитель
    }
}
