//
//  mathLab4Functions.swift
//  lab4.1
//
//  Created by misha on 04.06.2022.
//
/*    --------------------------------------------------------    */
import Foundation
/** Вычисляет значение функции при заданных x и N */
func f(_ x  : Double) -> Double {
    var sum:Double = 0
    sum += 0.25 * pow(x , 2.0)
    sum += 0.1 * x
    sum -= 0.8 * sqrt(Double(N!))
    sum += Double(N!) * (pow(sin( 2*x ), 4.0))
    sum += Double(N!) * pow(cos(x), 4.0)
    return sum
}
/** Вычисляет  и выводит значение функции на промежутке [a,b] с заданным шагом h */
func funcValuesOnSegment() {
    var x: Double = limit_a // начинаем от левого края
    /* ----------- Блок вывода шапки таблицы ---------- */
    print(" |-------------|---------------|")
    print(" |      X      |      F(X)     |")
    print(" |-------------|---------------|")
    while (x <= limit_b) {
        /* ----------- Блок вывода в данных виде таблицы ---------- */
        let F:Double = f(x)
        if x < 0  && F > 0 {
            print(" |   \(NSString(format:"%.3f", x))    |     \(NSString(format:"%.3f",F ))     |")// NSString - класс обертка предоставляющий методы изминения строк
        }
        if x < 0 && F < 0 {
            print(" |   \(NSString(format:"%.3f", x))    |    \(NSString(format:"%.3f", F ))     |")// NSString - класс обертка предоставляющий методы изминения строк
        }
        if x > 0 && F > 0 {
            print(" |    \(NSString(format:"%.3f", x))    |     \(NSString(format:"%.3f", F ))     |")// NSString - класс обертка предоставляющий методы изминения строк
        }
        if x > 0 && F < 0 {
            print(" |    \(NSString(format:"%.3f", x))    |    \(NSString(format:"%.3f", F ))     |")// NSString - класс обертка предоставляющий методы изминения строк
        }
        x += H // добавляем шаг
    }
    print(" |-------------|---------------|")
}
/** Вычисляет значение корня на заданном промежутке методом дихотомии */
func dichotomyMethod(x : Double, delta : Double) -> Double {
    // Находит только один корень,
    // если между левым и правым краем есть корень, то
    // получим отрицательное значение.
    // Потом сужаем облать поиска,
    // до того как значение функции не станет меньше эпсилон
    let eps:Double = 0.0001 // эпсилон
    var a:Double = x // левый край
    var b:Double = x + delta // правый край
    var c:Double = 0 // середина отрезка
    repeat {
        c = (a + b) / 2
        if (f(c) == 0) { return c }// нашли корень , который искали
        if (f(a) * f(c) < 0) { b = c } // выбрали левую половину
        else if (f(b) * f(c) < 0){ a = c } // выбрали правую половину

    } while (f(c) > eps)
    return c
}
/**  Ищет корни используя метод дихотомии  */
func findRootsDichotomyMethod() {
    roots = [] // обнуление массива корней, для новых N
    let delta: Double = 0.0001
    var x: Double = limit_a // начинаем от левого края
    while (x <= limit_b) {
        // корни есть только когда произвеение отрицательно
        if f(x) * f(x + delta) < 0 {
            roots.append(dichotomyMethod(x: x, delta: delta))
        }
        x += delta
    }
}
/**  Выводит корни используя метод дихотомии  */
func showRootsDichotomyMethod() {
    if roots.isEmpty { findRootsDichotomyMethod() } // без корней корни вывести не выйдет
    /* ----------- Блок вывода шапки таблицы ---------- */
    print(" |-------------|---------------|")
    print(" | Номер корня |     Корень    |")
    print(" |-------------|---------------|")
    var rootNumber: Int = 0
    while rootNumber < roots.count  {
        /* ----------- Блок вывода в данных виде таблицы ---------- */
        if roots[rootNumber] < 0 {
            print(" |      \(NSString(format:"%.i", rootNumber+1))      |    \(NSString(format:"%.3f", roots[rootNumber] ))     |")// NSString - класс обертка предоставляющий методы изминения строк
        }
        else {
            print(" |      \(NSString(format:"%.i", rootNumber+1))      |     \(NSString(format:"%.3f", roots[rootNumber] ))     |")// NSString - класс обертка предоставляющий методы изминения строк
        }
        rootNumber += 1
    } // конец while
    print(" |-------------|---------------|")
} // конец функции
/**  Вычисляет производную в заданной точке */
func derivative(_ a: Double) -> Double {
    let dx:Double = 0.01  // значение приращения
    return (f(a + dx) - f(a)) / dx  // по опрелению
}
/** Выводит количество экстремумов */
func countExtrema() {
    var extremaCounter: Int = 0
    let delta: Double = 0.001 
    var x: Double = limit_a // начинаем от левого края
    while (x <= limit_b) {
        // где - то перешли через ноль - > есть экстремум
        if (derivative(x) * derivative(x + delta) < 0) { extremaCounter += 1 }
        x += delta
    }
    print(" Количество экстремумов функции: \(extremaCounter)")
}
/** Вычисляет  и выводит значение интеграла, вычисленное методом  прямоугольников */
func rectanglesIntegrationMethod() {
    // граница задается корнями
    var a: Double = 0
    var b: Double = 0

    if roots.count > 2 {
        a = roots[1]
        b = roots[2]
    } else {
        if roots.count == 2 {
            a = roots[0]
            b = roots[1]
        } else { print(" 🛑 Ошибка: неизвестны границы интергирования \n") }
    }

    let n:Int = 1000 // количество кусочков
    let h: Double = (b - a) / Double(n) // расчет шага
    var integral: Double = 0 // значение интеграла
    var nomerKusochka:Int = 0
    while (nomerKusochka < n) {
        // суммирование промежутков
        integral += h * f(a + Double(nomerKusochka)*h)
        nomerKusochka += 1
    }
    print(" Значение интеграла\n между 2 и 3 корнем\n методом прямоугольников: \(NSString(format:"%.4f",integral))")
}
/** Вычисляет  и выводит значение интеграла, вычисленное методом трапецей */
func trapeziumIntegrationMethod () {
    // граница задается корнями
    var a: Double = 0
    var b: Double = 0
    if (roots.count > 2) {
        a = roots[1]
        b = roots[2]
    } else {
        if roots.count == 2 {
            a = roots[0]
            b = roots[1]
        } else { print(" 🛑 Ошибка: неизвестны границы интергирования \n") }
    }

    let n:Int = 1000 // количество кусочков
    let h: Double = (b - a) / Double(n)  // шаг
    var sum:Double = 0 //
    var nomerKusochka:Int = 0
    while (nomerKusochka < n-1) { // n - член учитывается ниже в формуле в виде f(b)
        // суммирование промежутков
        sum += f(a + Double(nomerKusochka)*h)
        nomerKusochka += 1
    }
    let integral: Double = h/2 * (f(a) + 2*sum + f(b))
    print(" Значение интеграла\n между 2 и 3 корнем\n методом трапецей:        \(NSString(format:"%.4f",integral))")
}
/** Вычисляет  и выводит значение интеграла, вычисленное методом Монте-Карло */
func monteCarloIntegrationMethod() {
    /*
     Генерируем случайно числа, в промежутке интегрирования,
     находим значения функции
     */
    var a: Double = 0
    var b: Double = 0
    if (roots.count > 2) {
        a = roots[1]
        b = roots[2]
    } else {
        if roots.count == 2 {
            a = roots[0]
            b = roots[1]
        } else { print(" 🛑 Ошибка: неизвестны границы интергирования \n") }
    }
   
    var sum:Double = 0
    print()
    let n: Int = enter_n()  // количество чисел для генерации
    print()
    // чем больше тем точнее
    var nomerKusochka:Int = 0
    var rng = SystemRandomNumberGenerator()
    while (nomerKusochka <= n) {
        /* хотим числа от левого до правого корня [a,b] */
        sum += f(Double.random(in: a...b, using: &rng))
        // смотрим значение функции в случайной точке из промежутка
        nomerKusochka += 1
    }
    print(" Значение интеграла\n между 2 и 3 корнем\n методом Монте-Карло:     \(NSString(format:"%.4f",((b-a)*sum/Double(n)) )) ") // среднее арифмитическое
}
/** Функция ввода параметра n для метода Монте-Карло*/
func enter_n() -> Int {
    var n: Int? = 0
    repeat{
        print(" Введите число n для задания\n точности вычисления методом Монте-Карло\n от 100 до 2000 включительно")
        n = Optional (enterNumberUnsignedInt())
        
        if n! < 100 || n! > 2000 {
            print(" ⚠️ Внимание: Нужно ввести число от 100 до 2000 включительно!")
            n = nil
        }
    } while n == nil // если ввод не удался, просим ввести снова
    return n!
}
/*    ---------------------------------------    */
