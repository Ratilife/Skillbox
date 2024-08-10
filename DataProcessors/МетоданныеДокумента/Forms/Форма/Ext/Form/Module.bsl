﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Для Каждого Документ Из Метаданные.Документы Цикл
		Элементы.ИмяДокумента.СписокВыбора.Добавить(Документ.Имя,Документ.Синоним);
	КонецЦикла;	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ПостроитьДерево(Имя,ОписаниеТипов,Дерево,ОбработанныеТипы)
	НоваяСтрока = Дерево.Строки.Добавить();
	НоваяСтрока.Значение = Имя;
	Типы = ОписаниеТипов.Типы();
	Для каждого Тип из Типы Цикл 
		СтрокаТипа = НоваяСтрока.Строки.Добавить();
		СтрокаТипа.Значение = "Тип: "+Тип;
		
		Если Справочники.ТипВсеСсылки().СодержитТип(Тип)
			ИЛИ Документы.ТипВсеСсылки().СодержитТип(Тип)
			ИЛИ ПланыСчетов.ТипВсеСсылки().СодержитТип(Тип)Тогда
			Если ОбработанныеТипы.Найти(Тип) = Неопределено Тогда 
				СсылкаМетаданные = Метаданные.НайтиПоТипу(Тип);
				ОбработанныеТипы.Добавить(Тип);
				ДобавитьКоллекцию(СтрокаТипа,"Стандартные реквизиты", "СтандартныеРеквизиты",Неопределено,ОбработанныеТипы,СсылкаМетаданные);
				ДобавитьКоллекцию(СтрокаТипа,"Реквизиты", "Реквизиты",Неопределено,ОбработанныеТипы,СсылкаМетаданные);
				СтрокаТЧасти = СтрокаТипа.Строки.Добавить();
				СтрокаТЧасти.Значение = "Табличные части";
				Для Каждого ТабличнаяЧасть из СсылкаМетаданные.ТабличныеЧасти Цикл
					СтрокаТЧ = СтрокаТЧасти.Строки.Добавить();
					СтрокаТЧ.Значение = ТабличнаяЧасть.Имя;
					Для Каждого Реквизит Из ТабличнаяЧасть.Реквизиты Цикл
						   ПостроитьДерево(Реквизит.Имя,Реквизит.Тип,СтрокаТЧ,ОбработанныеТипы);
					КонецЦикла;	
				КонецЦикла;	
				ДобавитьКоллекцию(СтрокаТипа,"Форма","Формы",Новый ОписаниеТипов("УправляемаяФорма"),ОбработанныеТипы,СсылкаМетаданные);
				ДобавитьКоллекцию(СтрокаТипа,"Команды","Команды",Новый ОписаниеТипов("КомандаФормы"),ОбработанныеТипы,СсылкаМетаданные);
				ДобавитьКоллекцию(СтрокаТипа,"Макеты","Макеты",Новый ОписаниеТипов("ТабличныйДокумент"),ОбработанныеТипы,СсылкаМетаданные);
				ОбработанныеТипы.Удалить(ОбработанныеТипы.Количество()-1);
			КонецЕсли;	
		КонецЕсли;	
	КонецЦикла;
КонецПроцедуры // ПостроитьДерево()
&НаСервереБезКонтекста
Процедура ДобавитьКоллекцию(Строка,ИмяСтроки,ИмяКоллекции,Тип=Неопределено,ОбработанныеТипы,СсылкаМетаданные)
	НоваяСтрока = Строка.Строки.Добавить();
	НоваяСтрока.Значение = ИмяСтроки;
	Для каждого Элемент Из СсылкаМетаданные[ИмяКоллекции] Цикл
	
		Если Тип = Неопределено Тогда
			ТипДанных = Элемент.Тип;
		Иначе
			ТипДанных = Тип;
		КонецЕсли;	
		ПостроитьДерево(Элемент.Имя,ТипДанных,НоваяСтрока,ОбработанныеТипы); 
	КонецЦикла;
КонецПроцедуры	
&НаСервере
Процедура ЗаполнитьДерево()
	ДеревоЗначений = РеквизитФормыВЗначение("Дерево");
	ОбработанныеТипы = новый Массив;
	ПостроитьДерево(ИмяДокумента,Новый ОписаниеТипов("ДокументСсылка."+ИмяДокумента),ДеревоЗначений,ОбработанныеТипы);
	ЗначениеВРеквизитФормы(ДеревоЗначений,"Дерево");
КонецПроцедуры // ЗаполнитьДерево()


&НаКлиенте
Процедура Заполнить(Команда)
	ЗаполнитьДерево();
КонецПроцедуры


&НаКлиенте
Процедура ИмяДокументаПриИзменении(Элемент)
	ЗаполнитьДерево();
КонецПроцедуры

