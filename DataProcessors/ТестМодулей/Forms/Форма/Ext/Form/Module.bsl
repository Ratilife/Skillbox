﻿&НаКлиенте
Перем Тест Экспорт;
&НаСервере
Перем Тест ;
&НаКлиенте
Перем В;

&НаКлиенте
Процедура НашаПроцедура()
	

	
КонецПроцедуры // НашаПроцедура()

&НаСервере
Процедура ТекстыМодулейНаСервере()
	Тест = Справочники.Контрагенты;	
	СлужебныеФункцииСервер.СообщитьЭлементСправочникаКонтрагенты();	
КонецПроцедуры

&НаКлиенте
Процедура ТекстыМодулей(Команда)
	Перем ДолгКонтрагентаЗаПериод, Результ22,Тест;
	//ДолгКонтрагентаЗаПериод=1 ;
	Сообщить("Проверка сообщ",СтатусСообщения.Важное);
	//НащМассив = Новый Массив;
	//НащМассив.Печать();
	СлужебныеФункцииСервер.СообщитьЭлементСправочникаКонтрагенты();
	ВажныеОператорыДляТеста();
	Сейчас =ТекущаяДата();  
	ТекстыМодулейНаСервере();
	ОператорПрисваивания() ;
	//УсловныйОператор(ДолгКонтрагентаЗаПериод,Результ22);
	ЦиклическийОператор();
	
	ПолученныйЦвет = ПримерыПодсказок();
	//Выполнен = Истина;
	// Выполняем тест оператора
	//ТекстоваяСтрока ="Номенклатура для добавления")
	//ОткрытьФорму("Отчет.ПродажиТоваров.Форма"); 
	ЦиклическийОператор() ;
	ПеременаяТексСообщения = "Проверка";
	ОбщегоНазначения.СообщитьПользователю(ПеременаяТексСообщения);
КонецПроцедуры

&НаКлиенте
Процедура ВажныеОператорыДляТеста()
	
	Перем Выполнен, ДолгКлиента, ДолгКонтрагентаЗаПериод;
	
	ДолгКонтрагентаЗаПериод=2;
	Выполнен = "Привет"; 	
	Выполнен = 5; 	
	Выполнен = Истина;
	ДолгКлиента = 23;
	НамДолжны = 3;
	НамДолжны =ДолгКлиента + 5;
	Перем3=2;
	_Моя12Переменная123 =0;
	
	
КонецПроцедуры

&НаСервере
Процедура ОчиститьКонтактнуюИнформацию( Ссылка) Экспорт
	НаборЗаписейКИ = РегистрыСведений.КонтактнаяИнформация.СоздатьНаборЗаписей();
	НаборЗаписейКИ.Отбор.Объект.Установить(Ссылка);
	НаборЗаписейКИ.Очистить();
	НаборЗаписейКИ.Записать();
	
КонецПроцедуры

&НаСервере
Функция ПроверитьЗначение(ПроверяемоеЗначение)
	ЗначениеПравильное = Ложь;	
	Если ПроверяемоеЗначение>1000 Тогда
		ЗначениеПравильное = Истина
		
		
	КонецЕсли; 	
	
	Возврат ЗначениеПравильное;	
	
КонецФункции // 
&НаСервере
Процедура ОператорПрисваивания()
	Перем ДолгКонтрагентаЗаПериодПеременная;
	Перем Результат55;
	ДолгКлиента = 10; 
	НамДолжны = 20;
	Перем3 = "АА";
	Перем3 =Истина;
	ДолгКлиента = НамДолжны+5;
	Перем3 = ДолгКлиента = НамДолжны;
	УсловныйОператор(,Результат55) ;
	
КонецПроцедуры
// Процедура - Условный оператор
//
// Параметры:
//  ДолгКонтрагентаЗаПериод	 - 	 - типа данных строка
//
&НаСервере
Процедура УсловныйОператор(ДолгКонтрагентаЗаПериод=Неопределено,Знач Результат)
	Если ДолгКонтрагентаЗаПериод=Неопределено Тогда
		
		ДолгКонтрагентаЗаПериод=ТекущаяДата();
		
	КонецЕсли; 
	// текст комментария это описание условного оператора
	//Если <Условие1> Тогда
	//	Действие 1
	//	Действие 2
	//ИначеЕсли <Условие2> Тогда
	//	Действие 3
	//Иначе
	//	Действие 4
	//КонецЕсли; 	
	//ЗадолженностьКлиента = 250;
	Если ДолгКонтрагентаЗаПериод=1 Тогда
		
		Результат = "Привет";
		
		
	КонецЕсли; 
	ДолгКонтрагентаЗаПериод= 2000;
	ТекстСообщения = "Привет";
	ОбслуживалсяВЭтомМесяце= Истина;
	КлиентНамДолжен = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
	Если ЗадолженностьКлиента= 100 Тогда
		
		
		КлиентНамДолжен = Истина;
	Иначе
		
		КлиентНамДолжен = Ложь;
		
	КонецЕсли; 
	ТекстДляСообщенияПоКлиенту = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
	а=4;
	//Руслана  
	If А >=3 Тогда
		
		
	КонецЕсли; 
	Если А >= 5 Тогда
		
		
		
	Иначе
		
		
		
	КонецЕсли; 
	//Руслана  
	Если А <> 3 Или А= 4 Или А =5 Тогда
		
		
		Сообщить("Правильное А");
	КонецЕсли; 
	//СегодняУМеняХорошееНастроение = Истина;
	Если  ЗадолженностьКлиента<100 И ЗадолженностьКлиента <> 0 Тогда
		Сообщить("Должен, Но немного, предупредить");
		Выполнен = Истина;
		
	ИначеЕсли ЗадолженностьКлиента<100 И ОбслуживалсяВЭтомМесяце Тогда
		Сообщить("Все хорошо");
	ИначеЕсли (ЗадолженностьКлиента >=100) И (ЗадолженностьКлиента <5000) Тогда
		Сообщить("Должен, многовато, не обслуживать");
	ИначеЕсли Не (СегодняУМеняХорошееНастроение Или ЗадолженностьКлиента=0) Тогда
		Сообщить("Пусть обслуживается");
	Иначе	
		Сообщить("прекратить сотрудничество");
		
	КонецЕсли;
	
	Выполнен = Истина;
	Если Выполнен  = Истина Тогда
		//некоторые действия
	КонецЕсли;
	
	Выполнен = Истина;
	Если  Выполнен Тогда
		
	Иначе
		
	КонецЕсли;
	Если Не Выполнен Тогда
		
		
		
	КонецЕсли; 
	//Если    ОбслуживалсяВЭтомМесяце И Не КлиентНамДолжен<100 Тогда
	//	
	//КонецЕсли; 
	
КонецПроцедуры
//про
//олд
&НаСервере
Процедура СервернаяПроцедура()
	
	
	
КонецПроцедуры // СервернаяПроцедура()


&НаКлиенте
Процедура ЦиклическийОператор()
	// цикл по счетчику	
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Сообщить( Счетчик);
	КонецЦикла;
	Для Сч=3 По 15 Цикл
		
		Сообщить( Сч);
		Сообщить(ТекущаяДата() +100);
		
	КонецЦикла; 
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Факториал = Факториал * Счетчик;
		//Счетчик = Счетчик+ 1;    // неверно изменять переменную счетчика принудительно
	КонецЦикла;
	Для Сч=1 По 15 Цикл
		
		Сообщить( Сч);
		Сч = Сч +1;
	КонецЦикла; 
	
	
	
	// цикл по условию
	Цена = 215;
	Остаток = 1000;
	
	
	
	Остаток = Остаток-Цена;	
	КоличествоТовара = 1;
	Пока Остаток > 0 Цикл
		КоличествоТовара = КоличествоТовара+1;
		Остаток =Остаток-Цена;
		Если Остаток< 215 Тогда
			Остаток=0;
		КонецЕсли; 
	КонецЦикла;
	Цена = 215;
	Остаток = 1000;
	
	
	Остаток = Остаток-Цена;	
	КоличествоТовара = 1;
	Пока Остаток > 0 Цикл
		КоличествоТовара = КоличествоТовара+1;
		Остаток =Остаток-Цена;
		Если Остаток< 215 Тогда
			Прервать;
			Сообщить(Остаток);
		КонецЕсли; 
	КонецЦикла;
	А = Истина;
	//Пока А Цикл
	//	КоличествоТовара = КоличествоТовара+1;
	//	
	//	Если КоличествоТовара > 3000000 Тогда
	//		А = Ложь;
	//	КонецЕсли; 	
	//	
	//КонецЦикла;
	
	// Цикл по коллекциям 
	Сумма = 0;
	Остаток=10000;
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(1);
	МассивЭлементов.Добавить(5);
	МассивЭлементов.Добавить(7);
	Для каждого Элемент Из МассивЭлементов  Цикл
		Сумма=Сумма+Элемент;
		Остаток =Остаток-Элемент;
		
	КонецЦикла;
	//Для каждого СтрокаТаблицы Из ТаблицаТоваров Цикл
	//
	//	
	//
	//КонецЦикла; 
	
	// подсказка Для ДЗ - формирование строки сообщения
	//Сообщить("7*"+Сч+"="+Результат);
	
КонецПроцедуры


// Процедура - Второй тест подсказки
//
// Параметры:
//  Пол	 - 	 - 
//
&НаСервере
Процедура ВторойТестПодсказки(Знач Пол)
	
	Перем Выполнен;
	
	Тест = Справочники.Контрагенты.ЧастноеЛицо;
	
	Выполнен = Истина;
	Если Пол =Перечисления.Пол.Мужской Тогда
		
		
		
	КонецЕсли;
	Если Выполнен Тогда
		
		
		
	Иначе
		
		
		
	КонецЕсли; 
	
КонецПроцедуры
&НаСервере

Процедура ТипыДанных() Экспорт
	// строка	
	Текст = "Привет";
	Текст = "Неверно заполнен реквизит"
	"Проведение документа невозможно";
	
	Текст = "Неверно заполнен реквизит" + "Проведение документа невозможно";
	
	Текст = "Неверно заполнен реквизит
	|Проведение документа невозможно";
	ТекстН = СтрЗаменить(Текст, "Неверно", "Верно");
	
	Текст = "Неверно заполнен реквизит ""Наименование""
	|Проведение документа невозможно";
	
	Числовая = 12%5;
	НамДолжны = -1;
	ПеремБ = НамДолжны <0;
	ТекущДата = ТекущаяДата() +1;
	
	ДатаДокумента =Дата (2014,10,3);
	ДатаДокумента =Дата ("20141003");
	
	ПустаяДата = Дата("00010101") ;
	ПустаяДата = Дата(1,1,1);
	Если ТекущДата = ПустаяДата Тогда
		
		
		
	КонецЕсли; 
	ТестСтрока = "А" + 2 + 3;
	ТестСтрока1 = 2 + 3 + Истина;	
	//Истина И 1 = Истина
	//Истина И 0 = Ложь
	Если ЗначениеЗаполнено(ТестСтрока1)  Тогда
		
		
		
	КонецЕсли; 	
	Элемент = Справочники.Контрагенты.ЧастноеЛицо;	
	Если ТипЗнч(Элемент) = Тип ("СправочникСсылка.Товары") Тогда
		Сообщить(ТипЗнч(Элемент) );
		//Сообщить("" +Элемент + " должен" + 2);
	КонецЕсли;
	
	// массив
	НовыйМассив = Новый Массив (10);
	// заполнение массива
	
	Для Значение = 0 По 25 Цикл
		
		НовыйМассив.Добавить(Значение);
		
	КонецЦикла; 
	НовыйМассив[0] =2;
	НовыйМассив.Добавить("АА");
	НовыйМассив.Вставить(0,ТекущаяДата()-1 );
	НовыйМассив.Добавить(ТекущаяДата());
	КоличествоЭлементов = НовыйМассив.Количество();
	
	Для Сч=0  По КоличествоЭлементов-1 Цикл
		
		Сообщить(НовыйМассив[Сч]);	
		
	КонецЦикла; 
	
	Для каждого ЭлементМассива Из НовыйМассив Цикл
		
		Сообщить(ЭлементМассива);	
		
	КонецЦикла; 
	
	Для Значение = 0 По 25 Цикл
		
		НовыйМассив.Вставить(0,Значение );
		
	КонецЦикла; 
	НовыйМассив.ВГраница() ;
	// структура
	НоваяСтруктура = Новый Структура();
	НоваяСтруктура.Вставить("Код",13) ;
	НоваяСтруктура.Вставить("Имя","Борщ");
	НоваяСтруктура.Вставить("Вес",200);
	//НоваяСтруктура = Новый Структура();
	НоваяСтруктура.Вставить("Код1") ;
	НоваяСтруктура.Вставить("Имя1");
	НоваяСтруктура.Вставить("НомерПаспорта","1222");
	НоваяСтруктура.Вес= 300;
	
	
	//НоваяСтруктура = Новый Структура("Код,Имя,Вес",13,"Борщ",200);
	//
	//НомерПаспорта = НоваяСтруктура.НомерПаспорта;
	
	
	Для каждого ЭлементСтруктуры Из НоваяСтруктура Цикл
		Сообщить(ЭлементСтруктуры.Ключ);
		Сообщить(ЭлементСтруктуры.Значение);
	КонецЦикла; 
	
	ИмеетсяВесВСтруктуре = Ложь;
	ТекущийВес = Неопределено;
	ИмеетсяВесВСтруктуре = НоваяСтруктура.Свойство("Вес", ТекущийВес);
	
	//Сообщить(ЭлементСтруктуры["Вес"]);
	
	// список значений
	НовыйСписокЗначений = Новый СписокЗначений;
	НовыйСписокЗначений.Добавить("Астра");
	НовыйСписокЗначений.Добавить("Роза");
	НовыйСписокЗначений.Добавить("Гладиолус");
	
	ЭлементСписка = НовыйСписокЗначений.НайтиПоЗначению("Астра");
	ЭлементСписка = НовыйСписокЗначений.НайтиПоИдентификатору(2);
	
	КопияСписка = НовыйСписокЗначений.Скопировать(); 
	
	//КопияСписка = НовыйСписокЗначений.ВызрузитьЗначения();
	//КопияСписка.ЗарузитьЗначения(НовыйСписокЗначений);
	
	
	НовыйСписокЗначений.СортироватьПоЗначению(НаправлениеСортировки.Возр);
	НовыйСписокЗначений.СортироватьПоПредставлению(НаправлениеСортировки.Убыв);
	
	// соответствие
	НовоеСоответствие = Новый Соответствие();
	НовоеСоответствие.Вставить(100,"Хорошая продажа") ;
	НовоеСоответствие.Вставить(300,"Очень хорошая продажа") ;
	НовоеСоответствие.Вставить(10,"Плохая продажа") ;
	
	Продажа = НовоеСоответствие[300];
	
	НовоеСоответствие[700] ="Супер продажа";
	
	// таблица значений
	НоваяТаблица = Новый ТаблицаЗначений;
	НоваяТаблица.Колонки.Добавить("Блюдо", Новый ОписаниеТипов("Строка"));
	НоваяТаблица.Колонки.Добавить("Вес", Новый ОписаниеТипов("Число"));
	НоваяТаблица.Колонки.Добавить("Стоимость", Новый ОписаниеТипов("Число"));
	
	СтрокаТаблицы = НоваяТаблица.Добавить();
	СтрокаТаблицы.Блюдо = "Борщ";
	СтрокаТаблицы.Вес = 300;
	СтрокаТаблицы.Стоимость = 30;
	
	СтрокаТаблицы = НоваяТаблица.Добавить();
	СтрокаТаблицы.Блюдо = "Суп";
	СтрокаТаблицы.Вес = 300;
	СтрокаТаблицы.Стоимость = 20;
	
	СтрокаТаблицы = НоваяТаблица.Добавить();
	СтрокаТаблицы.Блюдо = "Харчо";
	СтрокаТаблицы.Вес = 500;
	СтрокаТаблицы.Стоимость = 40;
	
	// дерево значений
	НовоеДерево = Новый ДеревоЗначений;
	НовоеДерево.Колонки.Добавить("Вид", Новый ОписаниеТипов("Строка"));
	НовоеДерево.Колонки.Добавить("Блюдо", Новый ОписаниеТипов("Строка"));
	НовоеДерево.Колонки.Добавить("Вес", Новый ОписаниеТипов("Число"));
	НовоеДерево.Колонки.Добавить("Стоимость", Новый ОписаниеТипов("Число"));
	
	СтрокаДерева = НовоеДерево.Строки.Добавить();
	СтрокаДерева.Вид = "Первые Блюда";
	ПодчиненнаяСтрока =  СтрокаДерева.Строки.Добавить();
	ПодчиненнаяСтрока.Блюдо = "Борщ";
	ПодчиненнаяСтрока.Вес = 300;
	ПодчиненнаяСтрока.Стоимость = 30;
	ПодчиненнаяСтрока =  СтрокаДерева.Строки.Добавить();
	ПодчиненнаяСтрока.Блюдо = "Суп";
	ПодчиненнаяСтрока.Вес = 300;
	ПодчиненнаяСтрока.Стоимость = 20;
	ПодчиненнаяСтрока =  СтрокаДерева.Строки.Добавить();
	ПодчиненнаяСтрока.Блюдо = "Харчо";
	ПодчиненнаяСтрока.Вес = 500;
	ПодчиненнаяСтрока.Стоимость = 40;
	
	СтрокаДерева = НовоеДерево.Строки.Добавить();
	СтрокаДерева.Вид = "Вторые Блюда";
	ПодчиненнаяСтрока =  СтрокаДерева.Строки.Добавить();
	ПодчиненнаяСтрока.Блюдо = "Картофельное пюре";
	ПодчиненнаяСтрока.Вес = 200;
	ПодчиненнаяСтрока.Стоимость = 10;
	ПодчиненнаяСтрока =  СтрокаДерева.Строки.Добавить();
	ПодчиненнаяСтрока.Блюдо = "Макароны";
	ПодчиненнаяСтрока.Вес = 100;
	ПодчиненнаяСтрока.Стоимость = 5;
	
	//типы от данных конфигурации
	
	СсылкаНаСправ= Справочники.Контрагенты.ЧастноеЛицо; 
	Если ТипЗнч(СсылкаНаСправ)=тип("СправочникСсылка.Товары") тогда
		Сообщить("Это Товары"); 
	КонецЕсли
	
КонецПроцедуры
&НаСервере

Процедура РаботаСКонстантами()
	
	ТекВалютаУчета = Константы.ВалютаУчета.Получить();
	Константы.ВыдавитьНапоминанияПользователю.Установить(Истина);
	Константы.ВалютаУчета.Установить();
КонецПроцедуры
&НаСервере

Процедура РаботаСоСправочниками()
	
	Товар=Справочники.Товары.Создать( );
	Товар.Наименование="Цукерки";
	Товар.ПроверитьЗаполнение( );
	
КонецПроцедуры
&НаСервере

Процедура РаботаСпользователями()
	ИмяПользователя = "Петренко Павло";
	Код = "Кладовщик_Петренко";
	ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоИмени(ИмяПользователя);
	ОбъектПользователь = ПользователиИнформационнойБазы.СоздатьПользователя();
	ОбъектПользователь.Имя = ИмяПользователя;
	ОбъектПользователь.Код = Код;
	ОбъектПользователь.Записать();
	
	
КонецПроцедуры
&НаСервере

Процедура РаботаДокументов()
	
	ПН = Документы.ПоступлениеТоваровИУслуг.СоздатьДокумент();
	ПН.Дата=ТекущаяДата();
	ПН.Записать(РежимЗаписиДокумента.Запись);
	ПНН = Документы.ПоступлениеТоваровИУслуг;
	ПННС = ПНН.НайтиПоНомеру("000000003") ;
	ПННСО = ПННС.ПолучитьОбъект();
	ПННСО.Записать(РежимЗаписиДокумента.Запись);
	количество = 10;
	НоваяДата = ТекущаяДата(); 
	
КонецПроцедуры  
&НаКлиенте
Процедура ДемонстрацияВопроса(Команда)
	//ПеременнаяКонтрагент = Справочники.Контрагенты.ЧастноеЛицо;
	  
	Если Вопрос("Работать или не работать",РежимДиалогаВопрос.ДаНет) = КодВозвратаДиалога.Да Тогда
		Сообщить("Будем трудиться");
	Иначе
		Сообщить("Ура");
		
		
	КонецЕсли; 
	
КонецПроцедуры

&НаКлиенте
Процедура ДемонстрацияПредупреждения(Команда)
	Предупреждение("Сегодня у нас много дел",,"Просто предупреждение");
	
КонецПроцедуры

&НаКлиенте
Процедура ДемонстрацияСообщения(Команда)
	Если Не ЗначениеЗаполнено(ДатаОбработки) Тогда
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Мое Сообщение";
		Сообщение.Сообщить();
		
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Не заполнена дата";
		Сообщение.Поле = "ДатаОбработки" ;
		Сообщение.ПутьКДанным = "ДатаОбработки";
		Сообщение.УстановитьДанные(ДатаОбработки);
		//Если ФормаВладелец <> Неопределено Тогда
		//	
		//	Сообщение.ИдентификаторНазначения= Новый УникальныйИдентификатор( ФормаВладелец) ;
		//	
		//	
		//КонецЕсли; 
		//Если ОбъектИлиСсылка <> Неопределено Тогда
		//КонецЕсли;
		
		Сообщение.Сообщить();
		Сообщение = Новый СообщениеПользователю;
		Сообщение.Текст = "Не заполнена ЗадолженностьКлиента";
		Сообщение.Поле = "ЗадолженностьКлиента" ;
		Сообщение.ПутьКДанным = "ЗадолженностьКлиента";
		Сообщение.УстановитьДанные(ЗадолженностьКлиента);
		
		Сообщение.Сообщить();
		
		
	КонецЕсли; 
КонецПроцедуры
&НаКлиенте 
Процедура ДемонстрацияПоказатьВопрос(Команда)
	Оповещение = Новый ОписаниеОповещения("ДемонстрацияПоказатьВопросЗавершение", ЭтотОбъект); 
	ТекстВопроса = "У Вас сегодня хорошее настроение?"; 
	
	ПоказатьВопрос(Оповещение, ТекстВопроса, РежимДиалогаВопрос.ДаНет); 
КонецПроцедуры 
&НаКлиенте 
Процедура ДемонстрацияПоказатьВопросЗавершение(Результат, ДополнительныеПараметры) Экспорт 
	
	Если Результат = КодВозвратаДиалога.Да Тогда //алгоритм заполнения 
		Сообщить("Ура");
	Иначе
		Сообщить("УУУУУУУУУУУУ");
		
		
		
	КонецЕсли; 
КонецПроцедуры    

&НаКлиенте
Процедура ДемонстрацияОповещения(Команда)
	
	ПоказатьОповещениеПользователя("Мы что - то делаем");
КонецПроцедуры


// <Описание процедуры>
//
// Параметры:
//  <ДатаЗапроса>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаСервере
Процедура ТестНаСервере(ДатаЗапроса, Контрагент)
	
	
	
КонецПроцедуры // ТестНаСервере()

&НаСервере
Процедура ДомашЗ3НаСервере()
	
	
КонецПроцедуры

&НаКлиенте
Процедура ДомашЗ3(Команда)
	ДомашЗ3НаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ВычислитьСумму(Цена,Количество,Сумма)
	
	Сумма = Цена*Количество;	
	
КонецПроцедуры // ВычислитьСумму()()
// <Описание функции>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
// Возвращаемое значение:
//   <Тип.Вид>   - <описание возвращаемого значения>
//
&НаСервере
Функция ПолучитьКонстанту()
	
	Возврат Константы.ВалютаУчета.Получить();
	
КонецФункции // ПолучитьКонстанту()
&НаКлиенте
Функция ВернутьТекущуюДату()
	ТекДата = ТекущаяДата();
	Возврат ТекДата;
	
КонецФункции // ВернутьТекущуюДату()()


&НаКлиенте
Процедура РассчитатьСуммы(Команда)
	Для каждого СтрокаТаблицы Из ТаблицаТоваров Цикл
		
		//СтрокаТаблицы.Сумма = СтрокаТаблицы.Количество * СтрокаТаблицы.Цена;
		//СтрокаТаблицы.Сумма = ВычислитьСуммуФункция(СтрокаТаблицы.Цена,СтрокаТаблицы.Количество);
		//ВычислитьСумму(СтрокаТаблицы.Цена,СтрокаТаблицы.Количество,СтрокаТаблицы.Сумма);
		СтрокаТаблицы.Сумма =  РасчетныеФункции.ВычислитьСумму( СтрокаТаблицы.Количество, СтрокаТаблицы.Цена);
	КонецЦикла; 
КонецПроцедуры


&НаКлиенте
Процедура ТаблицаТоваровКоличествоПриИзменении(Элемент)
	СтрокаТаблицы = Элементы.ТаблицаТоваров.ТекущиеДанные;
	СтрокаТаблицы.Сумма = СтрокаТаблицы.Количество * СтрокаТаблицы.Цена;
	
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	//Вставить содержимое обработчика
КонецПроцедуры 


// Процедура - Все в одной процедуре
//
// Параметры:
//  Команда	 - 	 - 
//
&НаКлиенте
Процедура ВсеВОднойПроцедуре(Команда)
	ДолгКлиента = 10; 
	НамДолжны = 20;
	Перем3 = "АА";
	Перем3 =Истина;
	ДолгКлиента = НамДолжны+5;
	Перем3 = ДолгКлиента = НамДолжны;
	
	
	// цикл по счетчику	
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Сообщить( Счетчик);
	КонецЦикла;
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Факториал = Факториал * Счетчик;
		//Счетчик = Счетчик+ 1;    // неверно изменять переменную счетчика принудительно
	КонецЦикла;
	
	
	
	// цикл по условию
	Цена = 215;
	Остаток = 1000;
	
	//Сообщить("7*"+Сч+"="+Рехультат);
	
	Остаток = Остаток-Цена;	
	КоличествоТовара = 1;
	Пока Остаток > 0 Цикл
		КоличествоТовара = КоличествоТовара+1;
		Остаток =Остаток-Цена;
		Если Остаток< 215 Тогда
			Остаток=0;
			Прервать;
		КонецЕсли; 
	КонецЦикла;
	А = Истина;
	//Пока А Цикл
	//
	//	
	//
	//КонецЦикла;
	
	// Цикл по коллекциям 
	Сумма = 0;
	Остаток=10000;
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(1);
	МассивЭлементов.Добавить(5);
	МассивЭлементов.Добавить(7);
	Для каждого Элемент Из МассивЭлементов  Цикл
		Сумма=Сумма+Элемент;
		Остаток =Остаток-Элемент;
		
	КонецЦикла;
	
	Для Сч =1 По 4 Цикл
		
		
		
	КонецЦикла;
	
	Результат = "Привет";
	ОбслуживалсяВЭтомМесяце= Истина;
	КлиентНамДолженНП = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
	КлиентНамДолженНП = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
	а=4;
	If А =3 Тогда
		
		
	КонецЕсли; 
	Если А = 5 Тогда
		
		
		
	Иначе
		
		
		
	КонецЕсли; 
	Если А = 3 Или А= 4 Или А =5 Тогда
		
		
		Сообщить("Правильное А");
	КонецЕсли; 
	СегодняУМеняХорошееНастроение = Истина;
	Если Не ЗадолженностьКлиента<100 Тогда
		Сообщить("Должен, Но немного, предупредить");
		КлиентНамДолженНП = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
		КлиентНамДолженНП = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
		Выполнен = Истина;
		Если ЗадолженностьКлиента<100 Или ОбслуживалсяВЭтомМесяце Тогда
			Сообщить("Все хорошо");
		КонецЕсли;
		
	ИначеЕсли (ЗадолженностьКлиента >=100) И (ЗадолженностьКлиента <5000) Тогда
		Сообщить("Должен, многовато, не обслуживать");
	ИначеЕсли СегодняУМеняХорошееНастроение Тогда
		Сообщить("Пусть обслуживается");
	Иначе	
		Сообщить("прекратить сотрудничество");
		
	КонецЕсли;
	
	Выполнен = Истина;
	Если Выполнен  = Истина Тогда
		//некоторые действия
	КонецЕсли;
	
	Выполнен = Истина;
	Если  Выполнен Тогда
		
	Иначе
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЦиклыИзПроц()
	
	Перем А, КоличествоТовара, МассивЭлементов, Остаток, Сумма, Сч, Счетчик, Факториал, Цена, Элемент;
	
	// цикл по счетчику	
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Сообщить( Счетчик);
	КонецЦикла;
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Факториал = Факториал * Счетчик;
		//Счетчик = Счетчик+ 1;    // неверно изменять переменную счетчика принудительно
	КонецЦикла;
	
	
	
	// цикл по условию
	Цена = 215;
	Остаток = 1000;
	
	//Сообщить("7*"+Сч+"="+Рехультат);
	
	Остаток = Остаток-Цена;	
	КоличествоТовара = 1;
	Пока Остаток > 0 Цикл
		КоличествоТовара = КоличествоТовара+1;
		Остаток =Остаток-Цена;
		Если Остаток< 215 Тогда
			Остаток=0;
			Прервать;
		КонецЕсли; 
	КонецЦикла;
	А = Истина;
	//Пока А Цикл
	//
	//	
	//
	//КонецЦикла;
	
	// Цикл по коллекциям 
	Сумма = 0;
	Остаток=10000;
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(1);
	МассивЭлементов.Добавить(5);
	МассивЭлементов.Добавить(7);
	Для каждого Элемент Из МассивЭлементов  Цикл
		Сумма=Сумма+Элемент;
		Остаток =Остаток-Элемент;
		
	КонецЦикла;
	
	Для Сч =1 По 4 Цикл
		
		
		
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ОператорПрисвоенияИзПроц()
	
	Перем ДолгКлиента, НамДолжны, Перем3;
	ДолгКлиента = 10; 
	НамДолжны = 20;
	Перем3 = "АА";
	Перем3 =Истина;
	ДолгКлиента = НамДолжны+5;
	Перем3 = ДолгКлиента = НамДолжны;
	
	
КонецПроцедуры


&НаКлиенте
Процедура РазделениеНаПроцедуры(Команда)
	
	
	ДолгКлиента = 10; 
	НамДолжны = 20;
	Перем3 = "АА";
	Перем3 =Истина;
	ДолгКлиента = НамДолжны+5;
	Перем3 = ДолгКлиента = НамДолжны;
	
	
	// цикл по счетчику	
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Сообщить( Счетчик);
	КонецЦикла;
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Факториал = Факториал * Счетчик;
		//Счетчик = Счетчик+ 1;    // неверно изменять переменную счетчика принудительно
	КонецЦикла;
	
	
	
	// цикл по условию
	Цена = 215;
	Остаток = 1000;
	
	//Сообщить("7*"+Сч+"="+Рехультат);
	
	Остаток = Остаток-Цена;	
	КоличествоТовара = 1;
	Пока Остаток > 0 Цикл
		КоличествоТовара = КоличествоТовара+1;
		Остаток =Остаток-Цена;
		Если Остаток< 215 Тогда
			Остаток=0;
			Прервать;
		КонецЕсли; 
	КонецЦикла;
	А = Истина;
	//Пока А Цикл
	//
	//	
	//
	//КонецЦикла;
	
	// Цикл по коллекциям 
	Сумма = 0;
	Остаток=10000;
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(1);
	МассивЭлементов.Добавить(5);
	МассивЭлементов.Добавить(7);
	Для каждого Элемент Из МассивЭлементов  Цикл
		Сумма=Сумма+Элемент;
		Остаток =Остаток-Элемент;
		
	КонецЦикла;
	
	Для Сч =1 По 4 Цикл
		
		
		
	КонецЦикла;
	
	
	Результат = "Привет";
	ОбслуживалсяВЭтомМесяце= Истина;
	КлиентНамДолженНП = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
	КлиентНамДолженНП = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
	а=4;
	If А =3 Тогда
		
		
	КонецЕсли; 
	Если А = 5 Тогда
		
		
		
	Иначе
		
		
		
	КонецЕсли; 
	Если А = 3 Или А= 4 Или А =5 Тогда
		
		
		Сообщить("Правильное А");
	КонецЕсли; 
	СегодняУМеняХорошееНастроение = Истина;
	Если Не ЗадолженностьКлиента<100 Тогда
		Сообщить("Должен, Но немного, предупредить");
		КлиентНамДолженНП = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
		КлиентНамДолженНП = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
		Выполнен = Истина;
		Если ЗадолженностьКлиента<100 Или ОбслуживалсяВЭтомМесяце Тогда
			Сообщить("Все хорошо");
		КонецЕсли;
		
	ИначеЕсли (ЗадолженностьКлиента >=100) И (ЗадолженностьКлиента <5000) Тогда
		Сообщить("Должен, многовато, не обслуживать");
	ИначеЕсли СегодняУМеняХорошееНастроение Тогда
		Сообщить("Пусть обслуживается");
	Иначе	
		Сообщить("прекратить сотрудничество");
		
	КонецЕсли;
	
	Выполнен = Истина;
	Если Выполнен  = Истина Тогда
		//некоторые действия
	КонецЕсли;
	
	Выполнен = Истина;
	Если  Выполнен Тогда
		
	Иначе
		
	КонецЕсли;
	
	//Присваивание();
	//Циклы();
	//Условный();
	
КонецПроцедуры
&НаКлиенте
Процедура Условный()
	
	Результат = "Привет";
	ОбслуживалсяВЭтомМесяце= Истина;
	КлиентНамДолженНП = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
	КлиентНамДолженНП = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
	а=4;
	If А =3 Тогда
		
		
	КонецЕсли; 
	Если А = 5 Тогда
		
		
		
	Иначе
		
		
		
	КонецЕсли; 
	Если А = 3 Или А= 4 Или А =5 Тогда
		
		
		Сообщить("Правильное А");
	КонецЕсли; 
	СегодняУМеняХорошееНастроение = Истина;
	Если Не ЗадолженностьКлиента<100 Тогда
		Сообщить("Должен, Но немного, предупредить");
		КлиентНамДолженНП = ?(ЗадолженностьКлиента= 100, Истина,Ложь);
		КлиентНамДолженНП = ?(ЗадолженностьКлиента<5000, "Передупредить","Прекратить сотрудничество");
		Выполнен = Истина;
		Если ЗадолженностьКлиента<100 Или ОбслуживалсяВЭтомМесяце Тогда
			Сообщить("Все хорошо");
		КонецЕсли;
		
	ИначеЕсли (ЗадолженностьКлиента >=100) И (ЗадолженностьКлиента <5000) Тогда
		Сообщить("Должен, многовато, не обслуживать");
	ИначеЕсли СегодняУМеняХорошееНастроение Тогда
		Сообщить("Пусть обслуживается");
	Иначе	
		Сообщить("прекратить сотрудничество");
		
	КонецЕсли;
	
	Выполнен = Истина;
	Если Выполнен  = Истина Тогда
		//некоторые действия
	КонецЕсли;
	
	Выполнен = Истина;
	Если  Выполнен Тогда
		
	Иначе
		
	КонецЕсли;
	
КонецПроцедуры // Условный()


&НаКлиенте
Процедура Присваивание()
	
	ДолгКлиента = 10; 
	НамДолжны = 20;
	Перем3 = "АА";
	Перем3 =Истина;
	ДолгКлиента = НамДолжны+5;
	Перем3 = ДолгКлиента = НамДолжны;
	
КонецПроцедуры // Присваивание()

&НаКлиенте
Процедура Циклы()
	
	
	// цикл по счетчику	
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Сообщить( Счетчик);
	КонецЦикла;
	А = 5;
	Факториал = 1;
	Для Счетчик = 1 По А Цикл
		Факториал = Факториал * Счетчик;
		//Счетчик = Счетчик+ 1;    // неверно изменять переменную счетчика принудительно
	КонецЦикла;
	
	
	
	// цикл по условию
	Цена = 215;
	Остаток = 1000;
	
	//Сообщить("7*"+Сч+"="+Рехультат);
	
	Остаток = Остаток-Цена;	
	КоличествоТовара = 1;
	Пока Остаток > 0 Цикл
		КоличествоТовара = КоличествоТовара+1;
		Остаток =Остаток-Цена;
		Если Остаток< 215 Тогда
			Остаток=0;
			Прервать;
		КонецЕсли; 
	КонецЦикла;
	А = Истина;
	//Пока А Цикл
	//
	//	
	//
	//КонецЦикла;
	
	// Цикл по коллекциям 
	Сумма = 0;
	Остаток=10000;
	МассивЭлементов = Новый Массив;
	МассивЭлементов.Добавить(1);
	МассивЭлементов.Добавить(5);
	МассивЭлементов.Добавить(7);
	Для каждого Элемент Из МассивЭлементов  Цикл
		Сумма=Сумма+Элемент;
		Остаток =Остаток-Элемент;
		
	КонецЦикла;
	
	Для Сч =1 По 4 Цикл
		
		
		
	КонецЦикла;
	
	
КонецПроцедуры // Циклы()

&НаКлиенте
Процедура ПередачаПараметров(Команда)
	Цена = 200;
	Количество = 300;
	Сумма = ВычислитьСуммуФункция(Цена,Количество);
	Сообщить(Сумма);	
	Сумма = 0;
	ВычислитьСуммуПроцедура(Цена,Количество,Сумма);	
	Сообщить(Сумма);
	Цена = 200;
	Количество = 300;
	Сумма = 0;
	ВычислитьСуммуПроцедураПоЗначению(Цена,Количество,Сумма);	
	Сообщить(Сумма);
	Сумма =РасчетныеФункции.ВычислитьСумму(Количество,Цена);
	Сообщить(РасчетныеФункции.ВозвратТекущегоВремени());	
КонецПроцедуры
&НаКлиенте
Функция ВычислитьСуммуФункция(ЦенаТовара, КоличествоТовара)
	//
	///
	А = 2+3;
	Сумма =   Окр(ЦенаТовара*КоличествоТовара,2);
	Возврат Сумма;
	
КонецФункции // ()
&НаКлиенте
Процедура ВычислитьСуммуПроцедура(ЦенаТовара, КоличествоТовара,СуммаЗаТовар)
	// процедура вычисляет сумму	
	СуммаЗаТовар = Окр(ЦенаТовара*КоличествоТовара,2);
	ЦенаТовара = 120;	
	
КонецПроцедуры // ()
&НаКлиенте
Процедура ВычислитьСуммуПроцедураПоЗначению(Знач ЦенаТовара, Знач КоличествоТовара,СуммаЗаТовар)
	
	СуммаЗаТовар = Окр(ЦенаТовара*КоличествоТовара,2);
	ЦенаТовара = 120;
	
КонецПроцедуры // ()

&НаКлиенте
Процедура ДемонстрацияПроцедурФункция(Команда)
	Если КоличествоМесяцев<>0 Тогда
		ЗадолженностьЗаМесяцЗначение =ЗадолженностьЗаМесяц(ЗадолженностьКлиента, КоличествоМесяцев);
	КонецЕсли; 
	ЗадолженностьЗаМесяцЗначение1 =ЗадолженностьЗаМесяц(ЗадолженностьКлиента);
	Сообщить(ЗадолженностьЗаМесяцЗначение);
	Если КоличествоМесяцев<>0 Тогда
		Сообщить(ЗадолженностьЗаМесяц(ЗадолженностьКлиента, КоличествоМесяцев));
		
	Иначе	
		Сообщить("Неверное количество месяцев");
		
	КонецЕсли; 
КонецПроцедуры
&НаКлиенте
Функция ЗадолженностьЗаМесяц(Сумма, КвоМесяцев=1)
	СуммаЗаМесяц = Окр(Сумма/КвоМесяцев,2);
	
	Возврат СуммаЗаМесяц;
	
КонецФункции // ()

&НаКлиенте
Процедура Подсказки(Команда)
	ОткрытьФорму("Справочник.Контрагенты.ФормаСписка"); 
	ПримерыПодсказок();
	Присваивание();
КонецПроцедуры
&НаСервере
Функция ПримерыПодсказок()
	
	Справочники.Контрагенты.НайтиПоНаименованию("Магазин");
	Справочники.Контрагенты.НайтиПоНаименованию("Маг",Ложь);	
	Спр = Справочники.Контрагенты.ЧастноеЛицо;
	Найденный =Справочники.Контрагенты.НайтиПоНаименованию("Маг",Ложь);
	ТекЦвет =WebЦвета.Васильковый;
	Пол =Перечисления.Пол;
	Контрагент=Справочники.Контрагенты;
	Тест = Справочники.Контрагенты.ПустаяСсылка();
	ТекКонтрагент = справочники.Контрагенты.ЧастноеЛицо;
	ТекКонтрагент=Справочники.Контрагенты;
	ВторойТестПодсказки(Пол);
	Выполнен = Истина;
	Выполнен=Истина;
	#Область Запрос
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ПоступлениеТоваровИУслуг.Ссылка,
	|	ПоступлениеТоваровИУслуг.ВерсияДанных,
	|	ПоступлениеТоваровИУслуг.ПометкаУдаления,
	|	ПоступлениеТоваровИУслуг.Проведен,
	|	ПоступлениеТоваровИУслуг.Контрагент
	|ИЗ
	|	Документ.ПоступлениеТоваровИУслуг КАК ПоступлениеТоваровИУслуг";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	#КонецОбласти 
	#Область цена
	//еапр 
	
	#КонецОбласти 
	
	
	Возврат ТекЦвет;
КонецФункции


// <Описание процедуры>
//
// Параметры:
//  <Цена, тип число>  - <Тип.Число> - <Цена для расчета
//  <Количество>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаСервере
Процедура МояСервернаяПроцедура(Цена,Количество)
	
	
	
КонецПроцедуры // МояСервернаяПроцедура()
// <Описание функции>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
// Возвращаемое значение:
//   <Тип.Вид>   - <описание возвращаемого значения>
//
&НаСервере
Функция ФункцияНаСервере()
	
КонецФункции // ФункцияНаСервере()
// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаКлиенте
Процедура ПримерПреобюразованияВопроса()
	
	Если Вопрос("Работать или не работать",РежимДиалогаВопрос.ДаНет) = КодВозвратаДиалога.Да Тогда
		Сообщить("Будем трудиться");
	КонецЕсли;
	
КонецПроцедуры // ПримерПреобюразованияВопроса()


&НаКлиенте
Процедура ДомашнееЗадание3(Команда)
	ДомашнееЗадание3НаСервере();
КонецПроцедуры
// <Описание процедуры>
//
// Параметры:
//  <Параметр1>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//  <Параметр2>  - <Тип.Вид> - <описание параметра>
//                 <продолжение описания параметра>
//
&НаСервере
Процедура ДомашнееЗадание3НаСервере()
	
	
	
КонецПроцедуры // ДомашнееЗадание3НаСервере()


&НаКлиенте
Процедура КомандаНаша(Команда)
	// Вставить содержимое обработчика.
КонецПроцедуры


&НаКлиенте
Процедура ДатаОбработкиПриИзменении(Элемент)
	
	
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	//Вставить содержимое обработчика
КонецПроцедуры 

&НаКлиенте
Процедура Рекурсия(Команда)
	ВывестиЧисла(1);
	Сообщить("Факториал");
	Сообщить(Факториал(5));
КонецПроцедуры
&НаКлиенте
Процедура ВывестиЧисла(пЧисло)
	Если пЧисло <= 20 Тогда
		Сообщить(Строка(пЧисло));
		пЧисло = пЧисло + 1;
		ВывестиЧисла(пЧисло);
	Иначе
		Возврат;
	КонецЕсли;
КонецПроцедуры
&НаКлиенте
Функция Факториал(НашеЧисло)
	Сообщить (НашеЧисло);
	
	Возврат ?(Число(НашеЧисло)<=1, 1, НашеЧисло * Факториал(НашеЧисло - 1));
КонецФункции

&НаСервере
Процедура ВызовПроцедурОбщегоМодуляНаСервере()
	
	СлужебныеФункцииСервер.СообщитьЭлементСправочникаКонтрагенты();
КонецПроцедуры

&НаКлиенте
Процедура ВызовПроцедурОбщегоМодуля(Команда)
	СлужебныеФункцииКлиент.СообщитьДень();	
	СлужебныеФункцииКлиент.СообщитьНомерДняНедели();
	ВызовПроцедурОбщегоМодуляНаСервере();
КонецПроцедуры

&НаСервере
Процедура ТестПроцедуры()
	
	
	
КонецПроцедуры // ТестПроцедуры()


&НаКлиенте
Процедура ПриЗакрытии()
	
КонецПроцедуры
&НаСервере
Процедура НашаНоваяПроцедура()
	
	
	
КонецПроцедуры // НашаНоваяПроцедура()

&НаКлиенте
Процедура ТаблицаТоваровЦенаПриИзменении(Элемент)
	СтрокаТаблицы = Элементы.ТаблицаТоваров.ТекущиеДанные;
	СтрокаТаблицы.Сумма = ВычислитьСуммуФункция(СтрокаТаблицы.Цена,СтрокаТаблицы.Количество);
КонецПроцедуры

&НаСервере
Процедура ПередЗакрытиемНаСервере()
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаКлиенте
Процедура ПередЗакрытием(Отказ, СтандартнаяОбработка)
	ПередЗакрытиемНаСервере();
КонецПроцедуры


