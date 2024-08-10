﻿
&НаКлиенте
Процедура ИмяФайлаОбменаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Диалог=Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	Диалог.Расширение="xml";
	Диалог.Фильтр="Табличный документ(*.xml)|*.xml";
	Если Диалог.Выбрать() тогда
		Объект.ИмяФайлаОбмена=Диалог.ПолноеИмяФайла;
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура ИмяФайлаПравилОбменаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Диалог=Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	Диалог.Расширение="xml";
	Диалог.Фильтр="Табличный документ(*.xml)|*.xml";
	Если Диалог.Выбрать() тогда
		Объект.ИмяФайлаПравилОбмена=Диалог.ПолноеИмяФайла;
		ЗагрузкаПравилОбменаСервер();
	КонецЕсли;		
КонецПроцедуры

&НаКлиенте
Процедура ИмяФайлаПротоколаОбменаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Диалог=Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	Диалог.Расширение="xml";
	Диалог.Фильтр="Табличный документ(*.xml)|*.xml";
	Если Диалог.Выбрать() тогда
		Объект.ИмяФайлаПротоколаОбмена=Диалог.ПолноеИмяФайла;
	КонецЕсли;		
КонецПроцедуры

&НаКлиенте
Процедура ИмяФайлаПротоколаОбменаЗагрузкаНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	Диалог=Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);
	Диалог.Расширение="xml";
	Диалог.Фильтр="Табличный документ(*.xml)|*.xml";
	Если Диалог.Выбрать() тогда
		Объект.ИмяФайлаПротоколаОбменаЗагрузка=Диалог.ПолноеИмяФайла;
	КонецЕсли;		
КонецПроцедуры

&НаСервере
Процедура ВыгрузкаСервер()
	ОбОбработка=ЭтаФорма.РеквизитФормыВЗначение("Объект");
	Для каждого стр из ОбОбработка.ТаблицаПравилВыгрузки.Строки цикл
		Найдено=Объект.ПравилаВыгрузкиДанных.НайтиСтроки(Новый Структура("ПВД",Стр.Наименование));
		Если Найдено.Количество()>0 тогда	
			Стр.Включить=?(Найдено[0].ВключитьФ,1,0);		
		КонецЕсли;
		Для каждого стр1 из Стр.Строки цикл 
			Найдено=Объект.ПравилаВыгрузкиДанных.НайтиСтроки(Новый Структура("ПВД",Стр1.Наименование));
			Если Найдено.Количество()>0 тогда	
				Стр1.Включить=?(Найдено[0].ВключитьФ,1,0);		
			КонецЕсли;   			
		КонецЦикла;  		
	КонецЦикла;
	ОбОбработка.ТаблицаНастройкиПараметров=ОбОбработка.ПараметрыТ.Выгрузить();
	//ЭтаФорма.ЗначениеВРеквизитФормы(ОбОбработка,"Объект");
	ОбОбработка.ВыполнитьВыгрузку();
	// Вставить содержимое обработчика.
КонецПроцедуры

&НаСервере
Процедура ЗагрузкаСервер()
	// Вставить содержимое обработчика.
	ОбОбработка=ЭтаФорма.РеквизитФормыВЗначение("Объект");
	ОбОбработка.ВыполнитьЗагрузку(); 	
КонецПроцедуры

&НаСервере
Процедура ЗагрузкаПравилОбменаСервер()
	// Вставить содержимое обработчика.
	ОбОбработка=ЭтаФорма.РеквизитФормыВЗначение("Объект");
	ОбОбработка.ЗагрузитьПравилаОбмена();
	ОбОбработка.ПравилаВыгрузкиДанных.Очистить();
	Для каждого стр из ОбОбработка.ТаблицаПравилВыгрузки.Строки цикл
		//НовСтр=Объект.ПравилаВыгрузкиДанных.Добавить();
		//ЗаполнитьЗначенияСвойств(НовСтр,Стр);
		//НовСтр.ВключитьФ=Стр.Включить=1;
		//НовСтр.ПВД=Стр.Наименование;
		Для каждого стр1 из Стр.Строки цикл
		НовСтр=ОбОбработка.ПравилаВыгрузкиДанных.Добавить();
		ЗаполнитьЗначенияСвойств(НовСтр,Стр1);
		НовСтр.ВключитьФ=Стр1.Включить=1; 
		НовСтр.ПВД=Стр.Наименование;
		КонецЦикла;	
	КонецЦикла; 	
	
	ОбОбработка.ПараметрыТ.Очистить();
	Для Каждого ТекПараметр Из ОбОбработка.Параметры Цикл
        Стр=ОбОбработка.ПараметрыТ.Добавить();
		Стр.Наименование=ТекПараметр.Ключ;
		Стр.Значение=ТекПараметр.Значение;		
	КонецЦикла;	 
	ЭтаФорма.ЗначениеВРеквизитФормы(ОбОбработка,"Объект");
КонецПроцедуры

&НаКлиенте
Процедура Выгрузка(Команда)
	// Вставить содержимое обработчика.
	 ВыгрузкаСервер();
КонецПроцедуры

&НаКлиенте
Процедура Загрузка(Команда)
	// Вставить содержимое обработчика.
	 ЗагрузкаСервер();
КонецПроцедуры

&НаКлиенте
Процедура ИмяФайлаПравилОбменаОткрытие(Элемент, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	ЗапуститьПриложение("explorer " + Объект.ИмяФайлаПравилОбмена);
	СтандартнаяОбработка = ЛОЖЬ;	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	// Вставить содержимое обработчика.
	ОбОбработка=ЭтаФорма.РеквизитФормыВЗначение("Объект");
	ОбОбработка.Параметры=Новый Структура;
	
	Если ОбОбработка.Метаданные().Макеты.Найти("Правила")<>Неопределено тогда
		ИмяВременногоФайла=ПолучитьИмяВременногоФайла("xml");
		Макет=ОбОбработка.ПолучитьМакет("Правила");
		Макет.Записать(ИмяВременногоФайла);
		Объект.ИмяФайлаПравилОбмена=ИмяВременногоФайла;
		ЭтаФорма.Элементы.ИмяФайлаПравилОбмена.Видимость=Ложь;
		ЗагрузкаПравилОбменаСервер();
	КонецЕсли;	
КонецПроцедуры

&НаКлиенте
Процедура ПериодПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	Объект.ДатаНачала=Период.ДатаНачала;
	Объект.ДатаОкончания=Период.ДатаОкончания;
КонецПроцедуры
