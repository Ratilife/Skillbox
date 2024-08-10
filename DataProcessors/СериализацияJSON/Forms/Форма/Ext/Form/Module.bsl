﻿
&НаСервере
Процедура СериализацияJSONНаСервере()
	JSONЗапись = Новый ЗаписьJSON;
	//Путь = Константы.ПутьКФайлу.Получить()+"\";
	Путь =  "E:\БАЗА 1С\Skillbox1\Файлы внешние\Файлы Для Выгрузки\";
	JSONЗапись.ОткрытьФайл(Путь+"Nom_JS.json");
	
	//DTO-сериализация предназначена для сохранения данных объекта в файл XML и создания объекта на основе данных, хранящихся в файле XML.
	//Для этого используется объект СериализаторXDTO, который может быть получен с помощью конструктора на основе существующей фабрики XDTO.
	СериализаторXDTO.ЗаписатьJSON(JSONЗапись,Объект.Номенклатура.ПолучитьОбъект(),НазначениеТипаXML.Явное);
	
	JSONЗапись.Закрыть();
	
	Сообщить("Данные выгружены "+Путь+"Nom_JS.json");
КонецПроцедуры

&НаКлиенте
Процедура СериализацияJSON(Команда)
	СериализацияJSONНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДокументСериализацияJSONНаСервере()
	JSONЗапись = Новый ЗаписьJSON;
	//Путь = Константы.ПутьКФайлу.Получить()+"\";
	Путь =  "E:\БАЗА 1С\Skillbox1\Файлы внешние\Файлы Для Выгрузки\";
	JSONЗапись.ОткрытьФайл(Путь+"Doc_JS.json");
	
	
	СериализаторXDTO.ЗаписатьJSON(JSONЗапись,Объект.ДокументСериализацияJSON.ПолучитьОбъект(),НазначениеТипаXML.Явное);
	
	JSONЗапись.Закрыть();
	Сообщить("Данные выгружены "+Путь+"Doc_JS.json");
КонецПроцедуры

&НаКлиенте
Процедура ДокументСериализацияJSON(Команда)
	ДокументСериализацияJSONНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДесиреализацияДокументНаСервере()
	ЧтениеJSON = Новый ЧтениеJSON;
	Путь =  "E:\БАЗА 1С\Skillbox1\Файлы внешние\Файлы Для Выгрузки\";
	ЧтениеJSON.ОткрытьФайл(Путь+"Doc_JS.json");
	
	Текст ="";	
	//Текст = "Содержимое файла после Сериализации "+ Символы.ПС;
	//
	//Пока ЧтениеJSON.Прочитать() Цикл
	//	ТипТекущегоЗначения = ЧтениеJSON.ТипТекущегоЗначения;
	//	Если ТипТекущегоЗначения = ТипЗначенияJSON.Число
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON.Строка
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON.Булево
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON.Null Тогда
	//		 
	//		 Текст = Текст + Символы.ПС + ЧтениеJSON.ТекущееЗначение;
	//
	//	 ИначеЕсли ТипТекущегоЗначения = ТипЗначенияJSON.Комментарий Тогда
	//	 
	//	 	 Текст = Текст + Символы.ПС + "Комментарий "+ ЧтениеJSON.ТекущееЗначение;
	//		 
	//	 ИначеЕсли ТипТекущегоЗначения = ТипЗначенияJSON.НачалоМассива 
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON.КонецМассива
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON.НачалоОбъекта
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON.КонецОбъекта
	//		 ИЛИ ТипТекущегоЗначения = ТипЗначенияJSON Тогда
	//		 
	//		 // ?
	//		 
	//	 КонецЕсли;
	// КонецЦикла;
	 Данные = СериализаторXDTO.ПрочитатьJSON(ЧтениеJSON);
	 Текст = Текст+"Содержимое Объекта после десереализации "+Символы.ПС;
	 Текст = Текст + Данные;
	 // ?
	 Для Каждого Реквизит из Данные.Метаданные().СтандартныеРеквизиты Цикл
		 Текст = Текст +Символы.ПС + Реквизит.Имя+": "+Данные[Реквизит.Имя]; 
	 КонецЦикла;
	 // ?
	 Для Каждого Реквизит из Данные.Метаданные().Реквизиты Цикл
		 Текст = Текст +Символы.ПС + Реквизит.Синоним+": "+Данные[Реквизит.Имя]; 
	 КонецЦикла;
	 //Перебор табличной части документа
	 Для Каждого ТЧ из Данные.Метаданные().ТабличныеЧасти Цикл
		  Текст = Текст +Символы.ПС + Реквизит.Синоним+": ";
		  Для Каждого СтрокаТЧ из Данные[ТЧ.Имя] Цикл
			  Текст = Текст +Символы.ПС;
			  Для Каждого Колонка из ТЧ.Реквизиты Цикл
				  Текст = Текст +Символы.Таб + СтрокаТЧ[Колонка.Имя]; 
			  КонецЦикла;	  
		  КонецЦикла;	  
	  КонецЦикла;
	ЧтениеJSON.Закрыть();  
КонецПроцедуры

&НаКлиенте
Процедура ДесиреализацияДокумент(Команда)
	ДесиреализацияДокументНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДесериализацияНоменклатураНаСервере()
	ЧтениеJSON = Новый ЧтениеJSON;
	Путь =  "E:\БАЗА 1С\Skillbox1\Файлы внешние\Файлы Для Выгрузки\";
	ЧтениеJSON.ОткрытьФайл(Путь+"Nom_JS.json");
	Данные = СериализаторXDTO.ПрочитатьJSON(ЧтениеJSON);
	Текст = "";
	Текст = Текст+"Содержимое Объекта после десереализации "+Символы.ПС;
	 Текст = Текст + Данные;
	 // ?
	 Для Каждого Реквизит из Данные.Метаданные().СтандартныеРеквизиты Цикл
		 Текст = Текст +Символы.ПС + Реквизит.Имя+": "+Данные[Реквизит.Имя]; 
	 КонецЦикла;
	 // ?
	 Для Каждого Реквизит из Данные.Метаданные().Реквизиты Цикл
		 Текст = Текст +Символы.ПС + Реквизит.Синоним+": "+Данные[Реквизит.Имя]; 
	 КонецЦикла;
	 //Перебор табличной части документа
	 Для Каждого ТЧ из Данные.Метаданные().ТабличныеЧасти Цикл
		  Текст = Текст +Символы.ПС + Реквизит.Синоним+": ";
		  Для Каждого СтрокаТЧ из Данные[ТЧ.Имя] Цикл
			  Текст = Текст +Символы.ПС;
			  Для Каждого Колонка из ТЧ.Реквизиты Цикл
				  Текст = Текст +Символы.Таб + СтрокаТЧ[Колонка.Имя]; 
			  КонецЦикла;	  
		  КонецЦикла;	  
	  КонецЦикла;


	ЧтениеJSON.Закрыть();

КонецПроцедуры

&НаКлиенте
Процедура ДесериализацияНоменклатура(Команда)
	ДесериализацияНоменклатураНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Сериализация = " это процесс сохранения состояния объекта в последовательность байт";
	Десериализация = " это процесс востановления объекта, из этих байтов";
КонецПроцедуры
