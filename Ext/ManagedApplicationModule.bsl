﻿
Процедура ПередНачаломРаботыСистемы(Отказ)
	//ОткрытьФорму("ОбщаяФорма.СведенияОбОрганизации");
	//Время = Час(ТекущаяДата());
	//Если Время >= 6 ИЛИ Время <= 11 Тогда
	//	Сообщить("ДоброеУтро!");	
	//ИначеЕсли  Время >= 12 ИЛИ Время <= 17 Тогда
	//	Сообщить("Добрый День!");
	//ИначеЕсли  Время >= 18 ИЛИ Время <= 23 Тогда	
	//	Сообщить("Добрый вечер!");
	//Иначе 	
	//	Сообщить("Доброго времени суток!");
	//КонецЕсли;	
	
	//Вариант1
	//СписокЗначений = ОбщееНазначение.ПолучитьСписокВариантовОбеда();
	//ВыбранныйЭлемент = СписокЗначений.ВыбратьЭлемент("Выберите себе чего - нибудь вкусненьекое");
	//Если ВыбранныйЭлемент <> Неопределено Тогда
	//	 ОбщееНазначение.ЗаписатьВариантОбедаНаСервере(ТекущаяДата(),ВыбранныйЭлемент.Значение);
	//КонецЕсли;
	
	//Вариант2
	//ВыбранныйЭлемент = Неопределено;
	//Если ВвестиЗначение(ВыбранныйЭлемент,"Выберите себе чего - нибудь вкусненьекое",Тип("СправочникСсылка.ВариантыОбедов")) Тогда
	//	ОбщееНазначение.ЗаписатьВариантОбедаНаСервере(ТекущаяДата(),ВыбранныйЭлемент);
	//КонецЕсли;	
КонецПроцедуры
