﻿&НаКлиенте
Процедура ЗаполнитьМеню(Команда)
	
	Меню2.Добавить(1,"Борщ и Плов");
	Меню2.Добавить(2,"Суп и Картошка");
	Меню2.Добавить(3,"Харчо и Макароны");
	
КонецПроцедуры

&НаСервере
Процедура СоздатьТаблицуЗначенийНаСервере()
	ТаблицаМеню.Очистить();
	СтрокаТаблицы = ТаблицаМеню.Добавить();
	СтрокаТаблицы.Блюдо = "Борщ";
	СтрокаТаблицы.Вес = 300;
	СтрокаТаблицы.Стоимость = 30;
	
	СтрокаТаблицы = ТаблицаМеню.Добавить();
	СтрокаТаблицы.Блюдо = "Суп";
	СтрокаТаблицы.Вес = 300;
	СтрокаТаблицы.Стоимость = 20;
	
	СтрокаТаблицы = ТаблицаМеню.Добавить();
	СтрокаТаблицы.Блюдо = "Харчо";
	СтрокаТаблицы.Вес = 500;
	СтрокаТаблицы.Стоимость = 40;
	
	ИтогСтоимости = ТаблицаМеню.Итог("Стоимость");
	Сообщить(ИтогСтоимости);
	КопияТаблицы = ТаблицаМеню.Выгрузить();
	КопияТаблицы.Свернуть("Блюдо","Вес");
	КопияТаблицы.Свернуть(,"Вес");
КонецПроцедуры

&НаКлиенте
Процедура СоздатьТаблицуЗначений(Команда)
	СоздатьТаблицуЗначенийНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДеревоНаСервере()
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
	
	ЗначениеВДанныеФормы(НовоеДерево, ДеревоМеню);
КонецПроцедуры

&НаКлиенте
Процедура Дерево(Команда)
	ДеревоНаСервере();
КонецПроцедуры
&НаСервере
Процедура ОбойтиСтроки(Строки)
	
	Для каждого Строка Из Строки Цикл
		
		Сообщить(Строка.Вид + " " + Строка.Блюдо);
		ОбойтиСтроки(Строка.Строки)
		
	КонецЦикла; 
	
КонецПроцедуры // ОбойтиСтроки()

&НаСервере
Процедура ОбойтиСтрокиНаФорме(Дерево)
	ЭлементыДерева=Дерево.ПолучитьЭлементы();
	
	Для каждого Строка Из ЭлементыДерева Цикл
		
		Сообщить(Строка.Вид + " " + Строка.Блюдо);
		ОбойтиСтрокиНаФорме(Строка)
		
	КонецЦикла; 
	
КонецПроцедуры // ОбойтиСтроки()
&НаСервере
Процедура ОбойтиДеревоНаСервере()
	
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
	
	Строки =  НовоеДерево.Строки;
	ОбойтиСтроки(Строки) ;
	
	ОбойтиСтрокиНаФорме(ДеревоМеню);		
	
	
КонецПроцедуры

&НаКлиенте
Процедура ОбойтиДерево(Команда)
	ОбойтиДеревоНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПроверитьПроцедуруМодуляНаСервере()
	Справочники.Контрагенты.ЧастноеЛицо.ПолучитьОбъект().СозданиеДубля();
	Справочники.Контрагенты.СозданиеДубляМодульМенеджера();;
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверитьПроцедуруМодуля(Команда)
	ПроверитьПроцедуруМодуляНаСервере();
КонецПроцедуры
&НаСервере
Функция ПримерПередачиПараметровСписком(Товар, Цена,Количество,Коэффициент)
	СуммаПоТовару = Окр(Цена*Количество*Коэффициент,2);
	Сообщить("Сумма по товару " + Товар +" "+ СуммаПоТовару);
	
	
КонецФункции // ПримерПередачиПараметровСписком()
&НаСервере
Функция ПримерПередачиПараметровСтруктурой(СтруктураДанных)
	СуммаПоТовару = СтруктураДанных.Цена*СтруктураДанных.Количество*СтруктураДанных.Коэффициент;
	Сообщить("Сумма по товару " + СтруктураДанных.Товар +" "+ СуммаПоТовару);
	Сообщить( СтруктураДанных.СтрокаНаименования);
	
	
КонецФункции // ПримерПередачиПараметровСписком()



&НаКлиенте
Процедура ПроверитьВыбор(Команда)
	Для каждого ЭлементСписка Из Меню2 Цикл
		Если ЭлементСписка.Пометка Тогда
			Сообщить(ЭлементСписка);
		КонецЕсли; 
		
		
	КонецЦикла; 
КонецПроцедуры
&НаКлиенте
Процедура ТипыДанныхНаКлиенте() 
	Перем ПроверкаНеопределено;
	// Тип данных строка	
	Текст = "Привет";
	Текст = "Неверно заполнен реквизит"
	"Проведение документа невозможно";
	
	Текст = "Неверно заполнен реквизит " + "Проведение документа невозможно";
	
	Текст = "Неверно заполнен реквизит
	|Проведение документа невозможно";
	ТекстН = СтрЗаменить(Текст, "Неверно", "Верно");
	
	Текст = "Неверно заполнен реквизит ""Наименование""
	|Проведение документа невозможно";
	СтрокаПустая = "";
	СтрокаПробелов = "    ";
	ДлинаНашейСтроки = СтрДлина(Текст);
	СтрокаСЧислами = "Сегодня 28.03.2017";
	СтрокаЧисел = "03";
	//НомерПозицииВСтроке = СтрНайти(СтрокаСЧислами,СтрокаЧисел);
	НомерПозицииВСтроке = Найти(СтрокаСЧислами,СтрокаЧисел);
	НоваяСтрока   = СокрЛП(СтрокаПробелов);
	Номер = ""; // пустая строка
	СимволИзстроки = Сред (Текст,5,1);
	ЛевыйСимвол= Лев(Текст,1);
	СтрочкаСпробелами = "аолправол     лдотжвдылао   ";
	СтрочкаСпробелами = СтрЗаменить(СтрочкаСпробелами,"   "," ");
	// Тип данных число
	
	ПеременнаяЧисло = -125.23 + (12 - 2) * 3/4;
	Числовая = 12%5;
	ОкруглениеЧисла = Окр(125.287,2)  ;
	Перем2 = -1;
	
	// Тип данных Булево
	Перемен3 = Истина;
	Перемен4 = Ложь;
	Результат = Текст <> ТекстН ;
	Если Результат Тогда
		
		Сообщить("Строки различные");
		
	КонецЕсли; 
	Перемен3 = 4*20/6;
	Перемен4 = 5;
	Результат = Перемен3 > Перемен4 ;
	Если Результат Тогда
		
		Сообщить("Перемен3 " + Перемен3 +" > Перемен4" + Перемен4);
		
	КонецЕсли; 
	//Если СтрокаПробелов Тогда
	//	
	//	Сообщить("Строки различные");
	//	
	//КонецЕсли; 	
	ПеремБ = Перем2 <0;
	
	// Тип данных Дата
	
	ТекущДата = ТекущаяДата() +3*24*60*60;
	
	ДатаДокумента =Дата (2014,10,3,19,37,05);
	ДатаДокумента =Дата (2014,10,3);
	ДатаДокумента =Дата ("20140903193705");
	ДатаДокумента =Дата ("20141003");
	
	ПустаяДата = Дата("00010101") ;
	ПустаяДата = Дата(1,1,1);
	ДатаНовая =  '20170328';
	НачалоНеделиТекД = НачалоНедели(ТекущаяДата());
	ДваМесяцаНазад =ДобавитьМесяц(ТекущаяДата(),-2);
	Если ТекущДата = ПустаяДата Тогда
	Иначе	
		Сообщить("Дата не пустая");
		
	КонецЕсли;
	ТекущМесяц = Месяц(ТекущаяДата());
	ДатаТекущегоМесяца= Дата(Год(ТекущаяДата()),Месяц(ТекущаяДата()), 12);
	// Преобразование типов
	ТестСтрока = ""+"А" + 2 + 3+Истина;
	ТестСтрока1 = 2 + 3 + Истина;	
	НовоеЧисло= 123+ "456";
	НоваяПеременная = Ложь+2;
	НоваяСтрока = "Сегодня " +Строка(ТекущаяДата());
	ТекДата = ТекущаяДата();
	НоваяДата = ТекДата+2 + Истина;
	
	НоваяПеременная = Число("34") ;
	НоваяСтрока = Строка(НоваяПеременная);
	СтрокаДоброеУтро = "Доброе утро"+Символы.ПС;
	// форматированная строка
	Строка1  = Новый ФорматированнаяСтрока(СтрокаДоброеУтро,Новый Шрифт(,,Истина), 
	WebЦвета.КрасноФиолетовый);
	Строка2  = Новый ФорматированнаяСтрока(Символы.ПС);
	Строка3  = Новый ФорматированнаяСтрока("Хорошего дня",Новый Шрифт(,,Истина), 
	WebЦвета.Бирюзовый);
	Строка = Новый ФорматированнаяСтрока(Строка1,Строка2,Строка3);
	Предупреждение(Строка); 
	
	//Тип данных   Null
	ПеременнаяNull = Null;
	
	//Тип данных   Неопределено
	ПеременнаНеопределено =  Неопределено;
	Если ТипЗнч(ТестСтрока)=Тип("Строка")	 Тогда
		
		
		
	КонецЕсли; 
	
	// массив
	НовыйМассив1 = Новый Массив ;
	НовыйМассив = Новый Массив (4);
	// заполнение массива
	
	Для Значение = 0 По 5 Цикл
		
		НовыйМассив.Добавить(Значение);
		
	КонецЦикла; 
	НовыйМассив[0] =2;
	НовыйМассив.Добавить("АА");
	НовыйМассив.Вставить(0,ТекущаяДата()-1 );
	НовыйМассив.Добавить(ТекущаяДата());
	КоличествоЭлементов = НовыйМассив.Количество();
	//обход коллекции циклом по счетчику
	ГраничноеКоличество = КоличествоЭлементов-1 ;
	
	Для Сч=0  По ГраничноеКоличество Цикл
		
		Сообщить(НовыйМассив[Сч]);	
		
	КонецЦикла; 
	//обход коллекции циклом по коллекции 
	
	Для каждого ЭлементМассива Из НовыйМассив Цикл
		
		Сообщить(ЭлементМассива);	
		
	КонецЦикла; 
	
	Для Значение = 0 По 12 Цикл
		
		НовыйМассив.Вставить(0,Значение );
		
	КонецЦикла; 
	НовыйМассив[2] = 8;
	НовыйМассив.Установить(2,9);
	ЭлементМассива = НовыйМассив.Получить(2);
	
	ЭлементМассива = НовыйМассив[2];
	ГраницаМассива =НовыйМассив.ВГраница() ;
	
	Для Сч=0  По ГраницаМассива Цикл
		
		Сообщить(НовыйМассив[Сч]);	
		
	КонецЦикла; 
	
	ИндексНайденногоЗначения =НовыйМассив.Найти(148);
	Если ИндексНайденногоЗначения = Неопределено Тогда
		
		Сообщить("Элемент " +"148"+ " не найден");
		
	КонецЕсли; 
	ИндексНайденногоЗначения1 =НовыйМассив.Найти(9);
	НовыйМассив1 = Новый Массив (10,2);
	
	// структура
	//варианты равнозначны
	//вариант объявления структуры 1
	НоваяСтруктура = Новый Структура();
	//вариант объявления структуры 2
	НоваяСтруктура = Новый Структура;
	НоваяСтруктура.Вставить("Код",13) ;
	НоваяСтруктура.Вставить("Имя","Борщ");
	НоваяСтруктура.Вставить("Вес",200);
	НоваяСтруктура.Вставить("Код1") ;
	НоваяСтруктура.Вставить("Имя1");
	НоваяСтруктура.Вставить("НомерПаспорта","1222");
	//Присвоение значения ключам структуры
	НоваяСтруктура.Вес= 300;
	НоваяСтруктура.Код1="345";
	// получение значения по ключу
	НомерПаспорта = НоваяСтруктура.НомерПаспорта;	
	НоваяСтруктура.Вес= 400;
	//вариант объявления структуры 3
	ПараметрыФормы = Новый Структура("СформироватьПриОткрытии",Истина);
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("СформироватьПриОткрытии",Истина);
	ПараметрыФормы.СформироватьПриОткрытии=Истина;
	НоваяСтруктура = Новый Структура("Код,Имя,Вес,Код1,Имя1,НомерПаспорта",13,"Борщ",200,300,345,"1222");
	//
	
	// перебор элементов структуры - используется редко
	Для каждого ЭлементСтруктуры Из НоваяСтруктура Цикл
		Сообщить(ЭлементСтруктуры.Ключ);
		Сообщить(ЭлементСтруктуры.Значение);
	КонецЦикла; 
	// проверка наличия ключа в структуре - 
	//рекомендуется выполнять всегда, если есть возможность того, что в разные моменты времени в структуре могут быть разне ключи, 
	//например при работе с параметрами формы
	
	ИмеетсяВесВСтруктуре = Ложь;
	ТекущийВес = Неопределено;
	ИмеетсяВесВСтруктуре = НоваяСтруктура.Свойство("Вес", ТекущийВес);
	ПеремЗначениеКлюча = "Вес";
	Сообщить(НоваяСтруктура[ПеремЗначениеКлюча]);
	Сообщить(НоваяСтруктура["Вес"]);
	Количество = 0;
	НоваяСтруктура.Свойство("Количество",Количество);
	Если Количество<>Неопределено Тогда
		
		//
		
	КонецЕсли; 
	Вес = 0;
	НоваяСтруктура.Свойство("Вес",Вес);
	
	
	// список значений
	НовыйСписокЗначений = Новый СписокЗначений;
	НовыйСписокЗначений.Добавить("Астра");
	НовыйСписокЗначений.Добавить("Роза");
	НовыйСписокЗначений.Добавить("Гладиолус");
	НовыйСписокЗначений1 = Новый СписокЗначений;
	НовыйСписокЗначений1.Добавить(1,"Астра");
	НовыйСписокЗначений1.Добавить(2,"Роза");
	НовыйСписокЗначений1.Добавить(3,"Гладиолус");
	
	ЭлементСписка = НовыйСписокЗначений.НайтиПоЗначению("Астра");
	ЭлементСписка = НовыйСписокЗначений.НайтиПоИдентификатору(2);
	
	КопияСписка = НовыйСписокЗначений.Скопировать(); 
	НовыйСписокЗначений.СортироватьПоПредставлению(НаправлениеСортировки.Убыв);
	НовыйСписокЗначений1.СортироватьПоПредставлению(НаправлениеСортировки.Убыв);
	НовыйСписокЗначений.СортироватьПоЗначению(НаправлениеСортировки.Возр);
	
	ЛюбимыйЦветокОтмеченные = НовыйСписокЗначений.ОтметитьЭлементы("Отметьте любимый цветок");
	Для каждого ЭлементМассива Из НовыйСписокЗначений Цикл
		Если ЭлементМассива.Пометка Тогда
			Сообщить("Вы Выбрали "+ЭлементМассива);
			
		КонецЕсли; 
		
		
	КонецЦикла; 
	ЛюбимыйЦветокВыбранные=НовыйСписокЗначений.ВыбратьЭлемент("Выберите любимый цветок");
	
	//КопияСписка = НовыйСписокЗначений.ВызрузитьЗначения();
	//КопияСписка.ЗарузитьЗначения(НовыйСписокЗначений);
	
	
	// соответствие
	НовоеСоответствие = Новый Соответствие();
	НовоеСоответствие.Вставить(100,"Хорошая продажа") ;
	НовоеСоответствие.Вставить(300,"Очень хорошая продажа") ;
	НовоеСоответствие.Вставить(10,"Плохая продажа") ;
	НовоеСоответствие.Вставить(НовыйМассив[0],123) ;
	
	
	Продажа = НовоеСоответствие[300];
	
	НовоеСоответствие[700] ="Супер продажа";
	
	
КонецПроцедуры
&НаСервере
Процедура ТипыДанныхНаСервере() 
	ТаблицаСДатами = Новый ТаблицаЗначений;
	ТаблицаСДатами.Колонки.Добавить("Работа");
	ТаблицаСДатами.Колонки.Добавить("Часы");
	ТаблицаСДатами.Колонки.Добавить("ЧасыЧисло");
	СтрокаТаблицы = ТаблицаСДатами.Добавить();
	СтрокаТаблицы.Работа = "Замена";
	СтрокаТаблицы.Часы ="2:30";
	ПозицияДв =   Найти(СтрокаТаблицы.Часы,":");
	Час = Число(Лев(СтрокаТаблицы.Часы,ПозицияДв-1));
	ДлинаСтроки = СтрДлина (СтрокаТаблицы.Часы);
	Минуты =Число(Прав(СтрокаТаблицы.Часы,ДлинаСтроки-ПозицияДв));
	
	СтрокаТаблицы.ЧасыЧисло =Окр(Час+Минуты/60,2);
	
	// тип данных строка - пернеос строк в тексте запроса
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
	//тип данных Тип	
	
	
	СсылкаНаСправ= Справочники.Контрагенты.ЧастноеЛицо; 
	Если ТипЗнч(СсылкаНаСправ)=Тип("СправочникСсылка.Товары") тогда
		
		Сообщить("Это Товары"); 
	КонецЕсли;
	Если ТипЗнч(СсылкаНаСправ)=Тип("СправочникСсылка.Контрагенты") тогда
		
		Сообщить("Это Контрагенты"); 
	КонецЕсли;
	//тип данных Структура	
	
	Товар = Справочники.Товары.НайтиПоНаименованию("Торт Празький",Истина);
	Цена = 100;
	Количество = 5;
	Коэффициент = 1;
	СтрокаНаименования = "USD";
	
	ПримерПередачиПараметровСписком(Товар, Цена,Количество,Коэффициент);	
	НоваяСтруктура = Новый Структура();
	НоваяСтруктура.Вставить("Коэффициент",Коэффициент);
	НоваяСтруктура.Вставить("Цена",Цена);
	НоваяСтруктура.Вставить("Количество",Количество);
	НоваяСтруктура.Вставить("Товар",Товар) ;
	НоваяСтруктура.Вставить("СтрокаНаименования",СтрокаНаименования) ;
	
	ПримерПередачиПараметровСтруктурой(НоваяСтруктура);
	
	Цена1 =  НоваяСтруктура.Цена;
	Товар1 =  НоваяСтруктура.Товар;
	
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
	СтрокаТаблицы = НоваяТаблица.Добавить();
	СтрокаТаблицы.Блюдо = "Харчо";
	СтрокаТаблицы.Вес = 500;
	СтрокаТаблицы.Стоимость = 40;
	КопияТаблицы = НоваяТаблица.Скопировать();
	КопияТаблицы.Свернуть("Блюдо,Вес,Стоимость","");
	КоличествоСтрокВТ1 = НоваяТаблица.Количество();
	КоличествоСтрокВТ2 = КопияТаблицы.Количество();
	Если КоличествоСтрокВТ1=КоличествоСтрокВТ2 Тогда
	     Сообщить( "Все ОК");
	 Иначе
	     Сообщить( "Есть дубли");
		 
	
	КонецЕсли; 
	Для каждого СтрокаТаблицыНаша Из НоваяТаблица Цикл
		Сообщить(СтрокаТаблицыНаша.Блюдо);
		
		
	КонецЦикла; 
	НайденнаяСтрока = НоваяТаблица.Найти("Харчо", "Блюдо");
	Если НайденнаяСтрока = Неопределено Тогда
		Сообщить(НСтр("Блюдо Харчо не найдено"));
	Иначе
		Стоимость = НайденнаяСтрока.Стоимость;
	КонецЕсли; 
	
	СтруктураДляОтбора =  Новый Структура("Вес",300 );
	НайденныеСтроки =НоваяТаблица.НайтиСтроки(СтруктураДляОтбора);
	Если НайденныеСтроки.Количество()>0 Тогда
		
		Сообщить(НайденныеСтроки[0].Блюдо);
		
		Для каждого НайденнаяСтрокаИзМассива Из НайденныеСтроки Цикл
			Сообщить(НайденнаяСтрокаИзМассива.Блюдо);
			Сообщить(НайденнаяСтрокаИзМассива.Вес);
			Сообщить(НайденнаяСтрокаИзМассива.Стоимость);
			
			
		КонецЦикла; 
	КонецЕсли;
	НоваяТаблица.Свернуть("Вес","Стоимость");
	ОбщаяСтоимость =НоваяТаблица.Итог("Стоимость");
	
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

&НаКлиенте
Процедура ПримитивныеТипыДанных(Команда)
	ТипыДанныхНаКлиенте() ;
	
	ТипыДанныхНаСервере();
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ПроверкаДанныхНаПустотуНаСервере()
	ПустойЭлементСправочникаКонтрагенты = Справочники.Контрагенты.ПустаяСсылка();
	ЧастноеЛицо = Справочники.Контрагенты.ЧастноеЛицо;
	Если ЧастноеЛицо.Пустая() Тогда
		
		
		
	КонецЕсли; 	
	Если ЧастноеЛицо = ПустойЭлементСправочникаКонтрагенты Тогда
		
		
		
	КонецЕсли; 
	Если Не ЗначениеЗаполнено(ЧастноеЛицо) Тогда
		
		
		
	КонецЕсли; 
КонецПроцедуры

&НаКлиенте
Процедура ПроверкаДанныхНаПустоту(Команда)
	СтроковаяПеременная = "Привет";
	ЧисловаяПеременная=22;
	ПеременнтаяТипаДата = ТекущаяДата();
	Если СтроковаяПеременная = "" Тогда
		
		
		
	КонецЕсли; 
	Если ЧисловаяПеременная = 0 Тогда
		
		
		
	КонецЕсли;
	Если ПеременнтаяТипаДата = Дата(1,1,1) Тогда
		
		
		
	КонецЕсли; 
	Если ЗначениеЗаполнено(СтроковаяПеременная) Тогда
		
		
		
	КонецЕсли; 
	Если ЗначениеЗаполнено(ЧисловаяПеременная) Тогда
		
		
		
	КонецЕсли; 
	Если ЗначениеЗаполнено(ПеременнтаяТипаДата) Тогда
		
		
		
	КонецЕсли; 
	
	
	ПроверкаДанныхНаПустотуНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьВТаблицуЗначенийНаСервере()
	ТаблицаЗначений = ТаблицаТоваров.Выгрузить();
	ТаблицаЗначений1  = ТаблицаТоваров.Выгрузить();
	ТаблицаЗначений.Свернуть("Товар","Сумма");
	//ТаблицаЗначений.Свернуть("Товар","Количество");
	ТаблицаЗначений.Свернуть("","Сумма");
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьВТаблицуЗначений(Команда)
	ВыгрузитьВТаблицуЗначенийНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммы(Команда)
	Для каждого СтрокаТаблицы Из ТаблицаТоваров Цикл
		
		СтрокаТаблицы.Сумма = СтрокаТаблицы.Количество * СтрокаТаблицы.Цена;
		
	КонецЦикла; 
КонецПроцедуры

&НаКлиенте
Процедура СообщитьИтог(Команда)
	ИтогПоТаблице =ТаблицаТоваров.Итог("Сумма");
	Сообщить(ИтогПоТаблице);
	
КонецПроцедуры
