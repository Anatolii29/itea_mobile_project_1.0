//
//  GlobalManager.swift
//  itea_project
//
//  Created by Anatolii on 6/2/19.
//  Copyright © 2019 Anatolii. All rights reserved.
//

import UIKit

class GlobalManager {
    
    func userManager() -> [User] {
        
        var userArray: [User] = []
        let user1 = User(name: "default",
                         password: "default",
                         photo: "default",
                         surname: "default",
                         age: 20,
                         city: "default",
                         birthday: "default",
                         email: "default",
                         telephone: "default")
        let user2 = User(name: "Anatolii",
                         password: "1234",
                         photo: "default",
                         surname: "default",
                         age: 20,
                         city: "default",
                         birthday: "default",
                         email: "default",
                         telephone: "default")
        let user3 = User(name: "1234",
                         password: "1234",
                         photo: "pitt1",
                         surname: "Pitt",
                         age: 20,
                         city: "Kiev",
                         birthday: "30.08.1990",
                         email: "1234@gmail.com",
                         telephone: "380931234567")
        userArray.append(user1)
        userArray.append(user2)
        userArray.append(user3)
        return userArray
    }
    
    func coursesManager() -> [Course] {
        
        
        
        let course1 = Course(name: "Testing",
                             photo: "qa-350",
                             time: .dayTime,
                             type: .design,
                             age: .adult)
        let course2 = Course(name: "Frontend dev",
                             photo: "frontend-350",
                             time: .eveningTime,
                             type: .design,
                             age: .adult)
        let course3 = Course(name: "JS development",
                             photo: "roadmap_javascript",
                             time: .eveningTime,
                             type: .frontend,
                             age: .adult)
        let course4 = Course(name: "Web-design",
                             photo: "product-350",
                             time: .online,
                             type: .mobile,
                             age: .kids)
        let course5 = Course(name: "Web-design",
                             photo: "product-350",
                             time: .dayTime,
                             type: .mobile,
                             age: .adult)
        var coursesArray: [Course] = []
        coursesArray.append(course1)
        coursesArray.append(course2)
        coursesArray.append(course3)
        coursesArray.append(course4)
        coursesArray.append(course5)
        subCourseManager(coursesArray: coursesArray)
        return coursesArray
    }
    
    func subCourseManager(coursesArray: [Course]) {
        
        let subCourse1 = SubCourse(name: "Testing Base",
                                   about: """
Базовый курс QA – программа обучения тестированию ПО с нуля. Курс  QA для начинающих включает овладение основными навыками и умениями проведения полноценного процесса тестирования. На QA-курсах вы познакомитесь с фундаментальными понятиями тестирования, научитесь создавать тест-кейсы, узнаете как находить баги и научитесь создавать отчеты. На уроках QA-тестирования вы будете создавать реальные тест-кейсы и изучите все виды и уровни тестов. Базовый курс QA – начальная ступень комплексной программы обучения тестированию, после которой вы сможете приступить к изучению Продвинутого курса QA и курса Автоматизированного тестирования.
""",
                                   afterCourse: """
- Понимать важность тестирования как неотъемлемой части разработки и внедрения программных продуктов
- Использовать на практике все виды и уровни тестов
- Находить баги и писать отчеты о них
- Создавать тест-кейсы и правильно их объединять в наборы
- Разбираться в каждой стадии QA-процесса
""",
                                   photo: "qa-350",
                                   program: """
1) Введение в тестирование ПО.

- Что такое тестирование. Для чего нужно тестирование программного обеспечения
- Жизненный цикл разработки ПО
- Основные документы, которые используются в процессе жизненного цикла разработки ПО
- Для чего нужен Test Plan и как его составлять
- Техника тест дизайна (Equivalence Partitioning, Boundary Values)
- Test Case как основной артефакт тестировщика
- Когда Test Case бывает негативный
- Составление тестового набора для первой тестируемой программы
2) Понятие дефекта.

- Что такое баг
- Зачем и где описывать Bug report
- Что такое severity и priority
- Жизненный цикл дефекта
- Системы отслеживания ошибок. Обзор самых популярных систем
- Знакомство с багтрекинговой системой Jira. Описание багов в системе
3) Виды требований.

- Виды документов с требованиями к программному обеспечению
- RDD
- SRS
- PRD
- BRD
- Критерии тестирования требований
- Полнота
- Однозначность
- Непротиворечивость
- Реализуемость
- Отслеживаемость
- Тестируемость
- Тестируем регистрационную форму. Специфика тестирования полей электронный адрес и телефон.
4) Методологии тестирования.

- Проектная команда. Виды методологий тестирования программного обеспечения
- Водопадная модель
- V-модель
- Итеративная модель
- RUP
- MSF
- Agile
- SCRUM
- Спринт
- Резерв проекта
- Резерв спринта
- Диаграмма выгорания
- Стори Поинт
- Остановка Спринта
- Покер Планирования
- Встречи в Скраме
5) Виды тестирования программного обеспечения.

- Функциональное тестирование
- Нефункциональное тестирование
- Тестирование, связанное с изменениями
6)Use Case и Check List.

- Что такое Use Case. Для чего нужен. Чем Use Case отличается от Test Case
- Что такое Check List. Где и когда применяют Check List. Может ли Check List заменить Test Case
- Как составить Use Case и Check List на примере тестирования любого предмета
- Случайное тестирование и тестирование без требований
- Ad-Hoc – процесс тестирования без спецификации
- Exploratory – исследовательское тестирование
- Когда применять и для каких проектов
- Применение на практике
7) Системы хранения и управления тестовыми случаями.

- Ознакомление с системой TestLink (Easy QA)
- Написание тестовых случаев в системе TestLink (Easy QA)
8) Нефункциональные виды тестирования.

- Тестирование производительности
- Нагрузочное тестирование (Performance and Load Testing)
- Стрессовое тестирование (Stress Testing)
- Тестирование стабильности или надежности (Stability / Reliability Testing)
- Объемное тестирование (Volume Testing)
- Тестирование установки (Installation testing)
- Тестирование удобства пользования (Usability Testing)
- Конфигурационное тестирование (Configuration Testing)
- С помощью каких инструментов проводят и для чего
9) Контроль полученных знаний.

- Пример стандартного собеседования
- Реальные задачи
- Что такое Pairwise Testing.
- Попарное тестирование. Когда, как и зачем применяется
- PICT - самый простой инструмент для автоматизации таких проверок

""")
        let subCourse2 = SubCourse(name: "Testing Advanced",
                                   about: """
Продвинутый курс QA разработан для детального изучения всех существующих возможностей, методов, моделей и жизненных циклов, а также новейших методик тестирования программного обеспечения. Хороший специалист прекрасно понимает, как важна безукоризненная работа программного продукта, которым будут пользоваться миллионы людей по всему миру. Именно поэтому высококвалифицированный тестировщик на сегодня является одним из самых востребованных специалистов в мировой IT-индустрий. Мы научим вас быстрой отладке ПО. Результатом наших совместных усилий будет ваша уверенность в завтрашнем дне как хорошо подготовленного специалиста, способного уже не предлагать свои услуги работодателям, а выбирать только самые лучшие предложения на рынке труда.
""",
                                   afterCourse: """
- Претендовать на должность младшего мануального тестировщика ПО
- Сдать сертификационный экзамен ISTQB Foundation
""",
                                   photo: "qa-350",
                                   program: """
- Основные понятия BDD, TDD, ATDD
- Введение в Gherkin синтаксис
- Практические упражнения по написанию Сценариев
- Введение в HTML - язык разметки гипертекста
- Стандарт HTML. Структура HTML-документа
- Создание HTML-документа
- Создание гиперссылок
- Списки и таблицы
- Введение в CSS
- Типы стилей
- Базовый синтаксис CSS
- Селекторы тегов
- Automation Testing basics
- Что такое XML - расширяемый язык разметки
- Язык XHTML. Разница между HTML и XML
- XML Path Language (Xpath) — язык запросов к элементам xml или xhtml
- Синтаксис XPath. Простые запросы с помощью XPath
- Автоматизированные тесты с помощью Selenium IDE
- Selenium - инструмент, используемый для разработки тестовых сценариев
- Язык команд Selenium
- Создание тестовых сценариев c Selenium IDE
- Часто используемые команды Selenium
- Достоинства и недостатки автоматизации тестирования
- Процесс внедрении автоматизации тестирования
- Что автоматизировать?
- ROI в автоматизации тестирования - коэффициент окупаемости инвестиций
- Зачем измерять эффективность?
- Автоматизация с помощью Selenium IDE
- Что такое База данных
- Виды баз данных
- Реляционная БД
- Системой Управления Баз Данных (СУБД)
- Язык SQL
- SQL- стандарты
- Работа с базами данных в SQL Server
- Создание базовых запросов SELECT
- Объединение таблиц
- Сортировка данных в результате запроса
- Расширенная фильтрация данных
- Как выбрать неповторяющиеся значения из базы данных
- Логический оператор LIKE
- Статистические функции
- MySQL
- Группирование данных
- Предложение HAVING
- Выбор данных из нескольких таблиц
- Вложенный запрос
- Написание выражений используя разные типы JOIN
- MySQL
- Написание простого выражения CASE
- Хранимые процедуры
- Введение в тестирование мобильных приложений
- Виды мобильных приложений
- Особенности тестирования мобильных приложений
- Сервисы для бета-тестирования
- Облачные платформы устройств для тестирования мобильных приложений
- Мобильное тестирование на эмуляторах мобильных устройств
""")
        let subCourse3 = SubCourse(name: "Testing Automation",
                                   about: """
Курс включает в себя основы программирования с нуля для тех, кто хочет заняться автоматизацией тестирования, но не знает с чего начать. В ходе практических занятий и домашних работ будут освоены все основные вопросы по автоматизации тестирования Web-приложений с использованием языка программирования Java. По окончанию курса каждый студент научится самостоятельно настраивать процесс автоматизации и структуру тестового фреймворка, что соотвествует уровню Middle QA Automation.
""",
                                   afterCourse: """
- Анализировать задачу и строить алгоритмы программы, используя условные и циклические конструкции
- Работать с переменными и реализовывать несложные математические операции
- Работать с функциями, событиями
- Анализировать и объяснять поведение простых программ, включающих конструкции, рассмотренные в курсе
""",
                                   photo: "qa-350",
                                   program: """
- Работа с IntelliJ IDEA (редактором для Java-кода)
- Работа с GIT и GitHub (cистемой контроля версий)
- Понятие алгоритма и роль алгоритмов в программировании
- Переменные, типы данных, выражения и присваивание значений переменным
- Базовый ввод/вывод данных
- Конструкции с условиями и их разновидности
- Итеративные конструкции (циклы) и их разновидности
- Базовые структуры данных
- Функции. Описание, вызов, параметризация
- Классы и обьекты
- Использование основных принципов ООП
- Работа с HTML как с DOM-структурой. Значение CSS для HTML-страниц
- Виды WebElement локаторов в Selenium WebDriver
- Язык запросов xPath для использования в качестве WebElement локаторов
- Использование принципов OOP при создании собственного тестового фреймворка
- Использование паттернов PageObject и PageFactory при создании собственного тестового фреймворка
- Debug и отладка кода тестов на основе стектрейса ошибки
- Использование testNG фреймворка для удобства работы с тестами
- Использование DataProvider для параметризированых тестов
- Использование Maven для тестового фреймворка
- Использование логгеров при работе автотестов
- Работа с Jenkins для запуска тестов (континиус интегрейшн системой)

""")
        let subCourse4 = SubCourse(name: "HTML/CSS course",
                                   about: """
Курс HTML/CSS —  это обучение работе с языком разметки веб-страниц. Программа предназначена для новичков, которые желают изучить основы работы с front-end разработкой. На курсе вы сможете освоить HTML с нуля: ознакомиться с теоретическими основами верстки и структурой HTML документа, порядком публикации документов в web и сможете создавать полноценные страницы. HTML для начинающих является базисом для веб-разработчиков, а после его изучения уже можно начинать работать над реальными проектами. Уже первый урок даст возможность попрактиковаться в создании несложных HTML-страниц, работе с мультимедиа и таблицами стилей CSS.

""",
                                   afterCourse: """
- Создавать веб страницы;
- Наполнять их содержимым (текстом, ссылками,спецсимволами, изображениями, фонами, подключать иконочные и обычные шрифты и тд );
- Добавлять стили всем элементам веб страницы;
- Выгружать сайты на хостинг;
- Понимать и разбираться в адаптивной, кроссбраузерной, попиксельной, резиновой, cмешаной и статичной верстками;
- Работать с WORDPRESS (Создавать и подключать базу данных к WP, загружать темы и работать с плагинами);
- Сверстать одностраничный сайт и выгрузить его на хостинг для общего доступа пользователей по ссылке.
""",
                                   photo: "frontend-350",
                                   program: """
- Ввод в веб-технологии
- Предназначение технологий;
- Стек разработки для сайта;
- Принцип работы ‘клиент-сервер’;
- Консоль разработчика;
- Текстовый редактор и IDE;
- Что такое HTML&CSS&JS и их взаимодействие;
HTML
- Базовые принципы верстки;
- Знакомство с понятием тега и атрибута;
- Обязательная структура любой веб-страницы;
- Понятия строчных и блочных элементов веб страницы;
- Понятия парных и непарных тегов;
- Семантические теги;
- Спецсимволы;
- Работа с тегами и атрибутами;
- Работа с ссылками и якорями;
- Работа с текстом и комментариями;
- Работа с различными системами цветов в HTML;
- Работа с изображениями;
- Нумерованные и маркированные списки;
- Работа с блоками(div);
- Таблицы;
- Формы;
- Элементы форм(инпуты);
- Айфреймы;
- Подключение разных модулей к документу HTML;
- Форматирование элементов HTML;
- Работа с браузером
- Установка полезных расширений для верстки;
- Отладчик кода;
- Хостинговые и доменные панели;
- Файловый менеджер(Filezilla);
CSS
- Что такое CSS;
- Базовые принципы написания стилей;
- 3 способа добавления CSS на HTML страницу;
- Внешние таблицы стилей;
- Относительные и статичные единицы измерения;
- Работа со шрифтами (семейства, стили, размеры, насыщенность)
- Работа с границами элементов (бордер радиус, тени);
- Работа с отступами и размерами элементов;
- Градиенты;
- Работа со свойствами float и clear;
- Flex box;
- Работа с фоном (изображения и цвет, размеры, прозрачность);
- Селекторы;
- Продвинутые селекторы;
- Приоритеты стилей;
- Перезапись стилей;
- Псевдоклассы, псевдоэлементы;
- Работа с анимацией элементов;
- Валидация;
- Медиазапросы;
- Адаптивная верстка;
- Резиновая верстка;
- Пиксель перфектная верстка;
- Статичная верстка;
- Кроссбраузерная верстка;
- Смешанная верстка ;
Фотошоп для разработчика
- Нарезка макета;
- Основные инструменты;
- Понятия сетки;
""")
        let subCourse5 = SubCourse(name: "JavaScript basic",
                                   about: """
Базовый курс JavaScript позволит вам изучить JavaScript с нуля или упорядочить и дополнить уже существующие знания. Уроки JavaScript для новичков посвящены фундаментальным аспектам этого языка программирования: лексическая структура, работа с переменными, типами операторов, функциями, массивами, объектами и другими разновидностями данных. Часть курса направлена на обучение работе с системой контроля версий Git и практическим занятиям, благодаря чему JavaScript для начинающих станет максимально ориентированным на получение знаний, применимых в реальных проектах.

""",
                                   afterCourse: """
- Работать с консолью разработчика и проверять код на предмет ошибок;
- Проводить различные операции с переменными, операторами, типами данных;
- Создавать приложения с помощью изученных условных и циклических конструкций;
- Более уверенно работать в команде и понимать логику рабочего процесса при разработке приложения.
""",
                                   photo: "frontend-350",
                                   program: """
Введение в Javascript
- Общая информация о языке и его особенности
- Справочники, спецификации и ссылки на них
- Консоль разработчика
- Внешние скрипты и порядок их подключения
- Переменные и правила их именования
- Типы данных и приведение типов
- Основные операторы
- Операторы сравнения и логические значения
- Условные операторы
- Логические операторы
- Конструкция switch
- Циклы и функции
- Циклы 'for', 'while', 'do...while'
- Рекурсия и понятие стека
- Понятие и синтаксис функции
- Функциональные выражения
- Области видимости
- Псевдомассив 'arguments'
- Функции обратного вызова (callback)
- Массивы
- Перебирающие методы
- Внутреннее представление массивов
- Объекты
- Передача по ссылке
- Перебор свойств
- Стандартные встроенные объекты
- Работа с Git
- Работа с Git Bash
- Workflow от создания репозитория до его отправки на удаленный сервер
- Работа с ветками
- Работа с конфигурационными файлами

""")
        let subCourse6 = SubCourse(name: "JavaScript advanced",
                                   about: """
Данный курс предназначен для тех, кто владеет базовыми знаниями и может использовать различные языковые конструкции для решения повседневных задач. В ходе обучения мы познакомимся с основоположными аспектами объектно-ориентированного программирования, работе с событиями, протоколом HTTP и прочими важными концепциями. Также будет очень много практики, а именно: разработка 8 приложений и решение задач, способствующих успешному прохождению собеседования.

""",
                                   afterCourse: """
- Использовать прототипно-ориентированную модель программирования;
- Понимать логику работы клиент-серверной архитектуры в контексте написания реальных приложений;
- правлять DOM через использование Javascript;
- Работать с локальными хранилищами данных.
""",
                                   photo: "frontend-350",
                                   program: """
- Прототипное наследование
- Прототип объекта
- Свойство prototype
- Встроенные классы
- Функция - конструктор
- Наследование классов
- Внутреннее устройство метода 'extend' и полифилл 'Object.create'
- Функциональное наследование
 ООП
- Общая информация про ООП
- Инкапсуляция
- Полиморфизм
- Наследование
- Абстракция данных
- Понятие 'класс'
- Контекст вызова и замыкания
- Работа с 'this' (4 способа использования)
- Использование 'call', 'apply'
- Работа с 'bind', карринг и полифилл
- Дескрипторы, геттеры и сеттеры свойств
- Шаблон проектирования 'Singletone' через замыкание
- Сборщик мусора
- Глобальный объект Window и работа с DOM
- Общая информация про 'window', 'navigator', 'document', 'location', 'history'
- Навигация по DOM элементам
- Свойства узлов
- Добавление и удаление узлов
- Работа со стилями
- Работа с координатами
- События
- Введение в браузерные события
- Порядок обработки событий (Event Loop)
- Асинхронные события
- Работа с SetTimeout/ SetInterval
- Всплытие и перехват
- Делегирование событий
- События с использованием мыши, клавиатуры и прокрутка
- Загрузка документа
- Работа с системой контроля версий
- Формирование страницы в браузере
- Формирование DOM пошагово
- Формирование Render Tree
- Порядок формирования CSSOM
- Оптимизация, минификация, работа с Http Cache.
- Способы хранения данных в браузере
- Cookies
- Localstorage/Sessionstorage
- IndexedDB
- Manifest
- ServiceWorker
- Progressive Web Application
- HTTP
""")
        let subCourse7 = SubCourse(name: "Frontend advanced",
                                   about: """
После окончания этого курса Вы сможете сделать Ваш код более семантичным согласно стандартам HTML5, а также улучшить свои навыки в верстке используя новые теги. Грамотно используя шаблоны проектирования и алгоритмы, Вы сможете правильно подходить к вопросу проектирования крупных проектов, а понимание работы тех или иных алгоритмов превратит написание кода в удовольствие.  Практическая часть курса предполагает написание 3-4 достаточно сложных проектов и постоянное решение задач по алгоритмам.

""",
                                   afterCourse: """
- Владеть современным стеком технологий для разработки Frontend
- Знать тонкости работы с браузером, современными библиотеками и фреимворками
""",
                                   photo: "frontend-350",
                                   program: """
- HTML 5
- Audio
- Video
- Data атрибуты
- Новые семантичные теги
- Navigator
- CSS 3
- Адаптивная / кроссбраузерная верстка
- Медиа запросы
- Препроцессоры (SCSS, LESS, SASS)
- Самые попурярные CSS фреймворки (Bootstrap, Foundation)
- Material Design
- CSS анимации
- Canvas
- Работа с API
- Использование при разработке игр
- Шаблоны проектирования
- Антипаттерны
- Наиболее востребованные шаблоны и их применение на практике.
- Шаблоны ООП
- Функциональное программирование
- Работа с системой контроля версий
- Webpack
- Полная настройка конфигурационного файла
- Сравнение с предыдущими версиями
- Использование в действующем проекте
- Использование плагинов
- Хранение данных в браузере
- LocalStorage / SessionStorage
- Проект с использованием средств хранения данных
- Service Workers
- Работа с алгоритмами
- Алгоритмы сортировки
- Алгоритмы комбинаторики и теории множеств
- Алгоритмы теории игр
- Agile / Scrum / Kanban
- React
- Настройка проекта
- Работа с роутами
- Введение в Redux / Mobx
""")
        let subCourse8 = SubCourse(name: "JavaScript profi",
                                   about: """
В ходе изучения этого курса вы познакомитесь с использованием наиболее популярных шаблонов проектирования. В частности будут рассмотрены MVC, MVP, MVVM и их реализация. Также вы получите понимание функционирования Webpack, которое так необходимо для работы с библиотеками и фреймворками. Уделим внимание наиболее актуальным концепциям разработки приложений, антипаттернам и веб-компонентам.

""",
                                   afterCourse: """
- Внедрять наиболее оптимальные подходы для решения сложных задач;
- Расширить знание языка через использование новых возможностей в ES6, ES7;
- Влиять на процесс оптимизации загрузки страницы и делать код читабельней;
- На практике использовать шаблоны проектирования и избегать применения антипаттернов.
""",
                                   photo: "roadmap_javascript",
                                   program: """
- Шаблоны проектирования
- Singleton
- Facade
- Mediator
- Decorator
- Prototype
- Command
- Factory
- Observer
- Mixin
- MVC/MVP/MVVM
- AMD/CommonJS
- Антипаттерны
- Webpack
- Общие сведения, принципы работы
- Настройка конфигурационного файла
- Работа с системой контроля версий
- ES6/ES7
- Переменные 'let'/'const'
- Деструктуризация
- Тип данных Symbol
- Функции, строки, объекты
- Set/Map
- Promise
- Async/await
- Веб компоненты
- Custom Elements
- Shadow DOM
- Шаблоны 'template'
- Single Page Application
- Общие сведения, история появления
- Преимущества и недостатки
- Typescript
- Введение в типы
- Компиляция
- Наследование
- Интерфейсы
""")
        let subCourse9 = SubCourse(name: "TypeScript",
                                   about: """
Современная разработка диктует свои требования к формированию клиентской части сайтов, и TypeScript - большой шаг к соответствию этим стандартам. В рамках курса Вы познакомитесь со всеми особенностями настройки и интеграции TypeScript, обучитесь работе с базовыми и комплексными типами, а также сможете создавать современную архитектуру приложения, базируемую на TypeScript.

""",
                                   afterCourse: """
- Использовать и интегрировать TypeScript в любые проекты;
- Использовать надстройку для клиентской и серверной части, написанной на Javascript;
- Сможете намного быстрее освоить фреймворки Angular и Ionic.
""",
                                   photo: "roadmap_javascript",
                                   program: """
- Введение в TypeScript
- Об авторе языка
- Роль TypeScript
- TypeScript компилятор
- Установка TypeScript и редакторы кода
- Утилита TSLint
- Базовые типы
- Объявление переменных с помощью const, let, var
- Основные базовые типы
- Приведение типов
- Пересечение и объединение типов
- Продвинутые возможности базовых типов
- Анотация типа
- Определения типов
- Функции
- Функции в TypeScript и JavaScript
- Тип параметров и тип возвращаемого значения
- Стрелочные функции
- Функциональный тип
- Типы параметров: необязательные, по умолчанию, рест
- Перегруженные функции
- Интерфейсы
- Что такое интерфейс
- Объявление интерфейса
- Интерфейсы для функционального типа
- Расширение интерфейсов
- Интерфейсы для классов
- Классы
- Что такое класс
- Члены класса: конструктор, свойства и методы
- Наследование
- Абстрактные классы
- Выражение класса
- Модули и пространства имен
- Отличия между пространством имен и модулем
- Создание и использование пространств имен
- Создание и использование модулей
- Дженерики (Общие типы)
- Что такое дженерики
- Параметр типа
- Дженерик функции
- Дженерик классы и интерфейсы
- Дженерик ограничения
""")
        let subCourse10 = SubCourse(name: "React native basic",
                                    about: """
Программа базового уровня позволит познакомиться с тонкостями использования фреймворка React Native. React Native предлагает ряд интегрированных компонентов, что позволяет разработчикам быстро и эффективно выполнять основные задачи.
""",
                                    afterCourse: """
- Разрабатывать простые приложения с использованием основных функций фреймворка React Native
- Работать с удаленными данными и визуальными компонентами
""",
                                    photo: "roadmap_javascript",
                                    program: """
Введение
- О курсе
- Обзор технологии React
- Обзор технологии React Native
- Актуальность мобильной разработки
- WebView. Гибридные приложения или нативные приложения
Настройка окружения
- Windows
- Mac
- Linux
Основы работы с React Native
- Проблемы при настройке среды для работы
- Структура проекта
- «Hello, World!» на React Native
- React vs React Native
- Создание компонентов с JSX
- Единый компонент, как точка входа для обеих платформ
Стилизация приложения
- Написание стилей для React Native
- Введение во FlexBox
- Создание стилизированных компонентов
- Повторное использование компонентов и стилей
- Получение удаленных данных
HTTP
- Шаблон компонента «Список»
- Классо-ориентированные компоненты
- Методы жизненного цикла компонента
- Получение данных средствами React Native
""")
        let subCourse11 = SubCourse(name: "Graphic design",
                                    about: """
Курс научит вас разрабатывать логотипы и переносить объекты в символы. В процессе обучения вы углубитесь в теорию цвета, научитесь их правильно сочетать, работать с текстами, типографикой и композицией, разберетесь с заданиями лого и фирменного стиля, узнаете о шрифтовых плакатах, лейблах и тд. В ходе курса вы также обзаведетесь бесценным скиллом – умением различать психофизиологические особенности в дизайне и создавать такие макеты, которые будут вызывать у покупателя интерес или стимулировать его к покупке. На каждом занятии Вы будете практиковаться с переходами, шрифтами, иконками, анимацией, чтобы в конечном итоге получался красивый лендинг, бренд-бук и др. дизайнерские продукты.
""",
                                    afterCourse: """
- Грамотно и корректно визуализировать задуманные идеи согласно законам композиционного построения
- Придерживаться структуры при построении макета и, благодаря этому, улучшать логичность иерархии сайта
- Правильно использовать свой творческий потенциал и генерировать нестандартные решения для дизайна
""",
                                    photo: "product-350",
                                    program: """
История и тренды графического дизайна
- История развития графического дизайна
- Популярные стили
- Кто задает тренды?
- Ресурсы для поиска вдохновения
- Скетчинг
Техники и инструменты
- Быстрая зарисовка идей
- Золотое сечение
- Золотое сечение
- Числа Фибоначчи
- Правило третей
- Поиски и подбор идеальных пропорций
Композиция
- Закон близости объектов
- Ритм, статика и динамика
- Правильная расстановка акцентов
- Визуальная иерархия
- Форма и контрформа
- Перспектива и пространство
- Технический дизайн
- Свет
- Построение теней
Основы типографики
- Классификация шрифтов и область их применения
- Параметры шрифтов
- Заголовки, подзаголовки, абзацы, текст
- Шрифтовые пары
- Разработка знаков
- Упрощение объектов
- Доведение объекта до знака
- Сохранение узнаваемости
- Стилизация
- Стилизация объектов
- Подбор стиля согласно задаче
- Цвета
- Работа с цветовым кругом
- Психофизиология цвета в дизайне
- Инструменты по подбору цветовых схем
Основные правила оформления работ
Презентация и защита проектов
""")
        let subCourse12 = SubCourse(name: "UX design",
                                    about: """
Программа курса построена так, чтобы пройти весь путь от исследования, разработки портретов пользователей, сценариев до построения прототипов, работ со шрифтами и композицией на практике.

""",
                                    afterCourse: """
- определять цели и роли UX-дизайнера;
- исследовать и анализировать поведенческие реакции на стиль оформления веб-сайта;
- правильно сегментировать аудиторию, учитывая ключевые бизнес-цели;
- выстраивать правильную информационную архитектуру, управлять решениями и влиять на их эффективность.

""",
                                    photo: "product-350",
                                    program: """
Основы UX
- Что такое UX?
- Бизнес цели и цели пользователя
- Процесс разработки продукта
- 5 основных составляющих UX
- Психология пользователя
- Опыт пользователя
- Точка зрения пользователя
- Рефлексы
- Убеждения
- Моделирование поведения
- Пользовательское исследование
Создание профиля пользователя
- Проектирование
- Паттерны проектирования
- Информационная архитектура
- User story и типы информационных архитектур
- Что такое Wireframe?
- Визуальное восприятие
- Контраст, глубина, размер
- Цвет
- Построение и разрыв паттерна
- Линейное и краевое натяжение
-  Z-F паттерны
Usability
- Элементы web-страницы
- Навигация, футер и т. д.
- Главный экран, картинки, текст
- Формы
- Кнопки
Тестирование
- Google Analytics
- Тепловые карты
- A/B тесты
Дипломный проект
Навыки презентации
""")
        let subCourse13 = SubCourse(name: "UI design",
                                    about: """
Согласны с тем, что невзрачный интерфейс, но с хорошим продуктом привлечет намного меньше потенциальных покупателей, нежели впечатляющее оформление, даже если и сам продукт далек от идеала? Тогда вам нужен этот курс, ведь именно пройдя его, Вы научитесь создавать дизайнерские шедевры для веб-среды. В процессе обучения Вы узнаете о секретах “продающего” визуального дизайна, разберетесь в психофизиологии графических интерфейсов, изучите основные формы и элементы интерфейса, а также откроете для себя лучшие тренды веб-дизайна.

""",
                                    afterCourse: """
- Создавать и оптимизировать цифровой пользовательский интерфейс
- Находить и предлагать наиболее простые точки взаимодействия пользователя с системой
- Правильно управлять иконками, анимацией и другим графическим контентом на сайте
- Разрабатывать и внедрять эффективные решения для повышения функциональности веб-сайта ационную архитектуру, управлять решениями и влиять на их эффективность.

""",
                                    photo: "product-350",
                                    program: """
Введение в курс UI
- Этапы разработки продукта
- Понятие UX/UI/GUI
Технические требования
- Настройки графических редакторов для создания макетов для Web
- Подготовка макетов для верстки
- Подготовка графических элементов
Дизайн мышление
- Создание настроения проекта (Moodboard)
- Скетчбук
- Вдохновение
- Генерация креативных идей
- Композиция
- Золотое сечение
- Контраст и нюанс
- Статика и динамика
- Акцент
- Доминанта
- Иерархия объектов
- Цвет
 Работа с цветовым кругом
- Монохромные, комплиментарные и близкие цвета
- Подбираем правильные цвета для сайта
- Инструменты для подбора цвета
Шрифт
- Web-типографика
- Визуальные элементы статьи
- Подбор шрифтов и шрифтовые пары
- Инструменты подбора Web-шрифтов
""")
        let subCourse14 = SubCourse(name: "Graphic redactors",
                                    about: """
Хотите научиться работать с векторными и растровыми изображениями, ретушировать фотографии, создавать Gif-анимации и подготавливать дизайн-макеты к верстке вебсайтов? Тогда этот курс именно для Вас!
""",
                                    afterCourse: """
- Работать в графических редакторах Adobe Photoshop, Adobe Illustrator, Figma/Sketch
- Редактировать изображения и рисовать простые макеты сайтов
- Готовить макеты для верстки веб-сайтов и основам допечатной подготовки.
""",
                                    photo: "product-350",
                                    program: """
Знакомство и возможности программы Adobe Photoshop. Создание и сохранение файлов
- Понятие «Растровое изображение». Отличия между растровым и векторным изображением. Области применения
- Виды цветовых моделей. Особенности и области применения различных цветовых моделей
Интерфейс, настройка рабочего пространства
- Создание нового изображения. Изменение основных параметров изображений
Работа со слоями
- Понятие слоя. Виды слоев. Меню «Слой» («Layer»)
- Способы создания слоя. Работа со слоями. Параметры слоя
- Управление слоями с помощью палитры «Layers»
- Особенности работы с многослойным изображением
- Выделение и связывание нескольких слоев. Трансформация содержимого слоя
- Операции со слоями. Слияние слоев. Группировка
Стили для слоев
- Инструменты выделения. Меню Выделение (Select)
- Назначение различных инструментов выделения, настройка параметров
- Трансформация формы выделения. Дополнение, вычитание и пересечение областей выделения
- Растушевка границы области выделения
- Выделение мягких и жестких форм
- Инструмент «Уточнить край» и коррекция выделенной области
- Действия с выделенной областью: перемещение, дублирование, масштабирование, поворот, искажение выделенной области
 Цветокоррекция
- Подготовка к цветокоррекции
- Базовая цветокоррекция. Команды тоновой и цветовой коррекции. Команды «Быстрой» коррекции
- Использование корректирующих слоев
- Преобразование цветной фотографии в черно-белую
Ретушь фотографии
- Этапы ретуши фотографий (портрет)
- Чистка и восстановление деталей изображения с помощью инструментов «Clone Stamp», «Spot Healing Brush», «Healing Brush». Чистка кожи
- Цветокоррекция отдельных участков изображения. Изменение насыщенности Осветление и затемнение участков изображения. (отбеливание зубов, замена цвета глаз и волос)
- Добавление элементов изображения (волосы)
- Фильтр «Liquify» и коррекция фигуры
- Использование инструмента «History Brush»
""")
        let subCourseArray1 = [subCourse1, subCourse2, subCourse3]
        let subCourseArray2 = [subCourse4, subCourse5, subCourse6, subCourse7]
        let subCourseArray3 = [subCourse8, subCourse9, subCourse10]
        let subCourseArray4 = [subCourse11, subCourse12]
        let subCourseArray5 = [subCourse13, subCourse14]
        
        coursesArray[0].subCourseArray = subCourseArray1
        coursesArray[1].subCourseArray = subCourseArray2
        coursesArray[2].subCourseArray = subCourseArray3
        coursesArray[3].subCourseArray = subCourseArray4
        coursesArray[4].subCourseArray = subCourseArray5
        
    }
    
}
