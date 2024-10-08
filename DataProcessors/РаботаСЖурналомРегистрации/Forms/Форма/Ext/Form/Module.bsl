﻿
&НаСервереБезКонтекста
Процедура ИспользованиеЖурналаНаСервере()
	ТекУровень = ПолучитьИспользованиеЖурналаРегистрации();
	//НовыйУровень = Новый Массив;
	// УстановитьИспользованиеЖурналаРегистрации(НовыйУровень);
	НовыйУровень = Новый Массив;
	НовыйУровень.Добавить(УровеньЖурналаРегистрации.Ошибка);
	УстановитьИспользованиеЖурналаРегистрации(НовыйУровень);
	
КонецПроцедуры

&НаКлиенте
Процедура ИспользованиеЖурнала(Команда)
	ИспользованиеЖурналаНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыгрузитьЖурналНаСервере()
	ТаблицаЖурнала = Новый ТаблицаЗначений;
	СписокОтбора = Новый Структура;
		//СписокОтбора = Новый Структура;
	Если ЗначениеЗаполнено(ПериодЖурнала) Тогда
		СписокОтбора.Вставить("ДатаНачала",ПериодЖурнала.ДатаНачала);
		СписокОтбора.Вставить("ДатаОкончания",ПериодЖурнала.ДатаОкончания );
	КонецЕсли; 
	Если ЗначениеЗаполнено(СокрЛП(СобытиеДляОтбора)) Тогда
		СписокОтбора.Вставить("Событие",СокрЛП(СобытиеДляОтбора) );
	КонецЕсли; 	
	
	ТаблицаЗначений = Новый ТаблицаЗначений;
	Если  СписокОтбора.Количество() = 0 Тогда
		
		ВыгрузитьЖурналРегистрации (ТаблицаЗначений);
		
	Иначе
		ВыгрузитьЖурналРегистрации (ТаблицаЗначений,СписокОтбора);
		
	КонецЕсли; 
	Журнал.Загрузить(ТаблицаЗначений);	
	
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьЖурнал(Команда)
	//очень важный
	ВыгрузитьЖурналНаСервере();
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПолучитьАвтораДокументаНаСервере(ТекДок)
	ТаблицаЖурнала = Новый ТаблицаЗначений;
	Фильтр = Новый Структура("Данные,Событие",ТекДок,"_$Data$_.New" );
	ВыгрузитьЖурналРегистрации(ТаблицаЖурнала,Фильтр);
	Если ТаблицаЖурнала.Количество()>0 Тогда
		Автор =ТаблицаЖурнала[0].ИмяПользователя;
		
	Иначе	
		Автор=Неопределено;
	КонецЕсли; 
	ТаблицаЖурнала = Новый ТаблицаЗначений;
	Фильтр = Новый Структура("Событие","_$Data$_.New" );
	ВыгрузитьЖурналРегистрации(ТаблицаЖурнала,Фильтр);
	Если ТаблицаЖурнала.Количество()>0 Тогда
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваров.Ссылка КАК Ссылка
		|ИЗ
		|	Документ.ПоступлениеТоваров КАК ПоступлениеТоваров";
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			СтрокаТаблицы = ТаблицаЖурнала.Найти(ВыборкаДетальныеЗаписи.Ссылка,"Данные");
			Если СтрокаТаблицы<>Неопределено Тогда
				
				Автор =СтрокаТаблицы.ИмяПользователя;
				ТекОбъект = ВыборкаДетальныеЗаписи.Ссылка.ПолучитьОбъект();
				ТекОбъект.Автор = ВернутьПользователя(Автор);
				ТекОбъект.Записать();		   
			КонецЕсли; 
		КонецЦикла;
		
		
	Иначе	
		Автор=Неопределено;
	КонецЕсли; 
	Возврат Автор;
КонецФункции

&НаКлиенте
Процедура ПолучитьАвтораДокумента(Команда)
	Сообщить(ПолучитьАвтораДокументаНаСервере(ПоступлениеТоваровИУслуг));
КонецПроцедуры

&НаКлиенте
Процедура ПериодЖурналаПриИзменении(Элемент)
	ВыгрузитьЖурналНаСервере() ;
	
КонецПроцедуры

&НаСервереБезКонтекста
Функция СобытиеДляОтбораНачалоВыбораНаСервере(ТекЖурнал)
	ТекТаблица =ТекЖурнал.Выгрузить(); 
	ТекТаблица.Свернуть("Событие","");
	ТекТаблица.Сортировать("Событие");
	СписокДляВыбора = Новый СписокЗначений;
	Для каждого СтрокаТаблицы Из ТекТаблица Цикл
		СписокДляВыбора.Добавить(СтрокаТаблицы.Событие);
	КонецЦикла; 
	Возврат СписокДляВыбора;
КонецФункции


&НаКлиенте
Процедура СобытиеДляОтбораНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	Если Журнал.Количество()=0 Тогда
		
	Иначе
		ТекТаблицаДляПередачиНаСервер = Журнал;
		ДанныеВыбора = 	СобытиеДляОтбораНачалоВыбораНаСервере(ТекТаблицаДляПередачиНаСервер);
		СтандартнаяОбработка = Ложь;
		
	КонецЕсли; 	
КонецПроцедуры

&НаСервереБезКонтекста
Функция ВернутьПользователя(ИмяПользователя)
	ТекПользователь = Неопределено;
		
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	Пользователи.Ссылка
	|ИЗ
	|	Справочник.Пользователи КАК Пользователи
	|ГДЕ
	|	Пользователи.Код = &Код";
	
	Запрос.УстановитьПараметр("Код", ИмяПользователя);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		ТекПользователь = ВыборкаДетальныеЗаписи.Ссылка;
	КонецЦикла;
	
		
	
	Возврат ТекПользователь;
	
	
КонецФункции // ВернутьПользователя()

