﻿// Возвращает дополнительные реквизиты и сведения у указанного объекта.
//
// Параметры:
//  ВладелецСвойств      - Ссылка - например, СправочникСсылка.Номенклатура, ДокументСсылка.ЗаказПокупателя, ...
//                       - Объект - например, СправочникОбъект.Номенклатура, ДокументОбъект.ЗаказПокупателя, ...
//                       - ДанныеФормыСтруктура - коллекция по типу объекта владельца свойств.
//  ПолучатьДопРеквизиты - Булево - в результат включать дополнительные реквизиты.
//  ПолучатьДопСведения  - Булево - в результат включать дополнительные сведения.
//
// Возвращаемое значение:
//  Массив - значения
//    * ПланВидовХарактеристикСсылка.ДополнительныеРеквизитыИСведения - если есть.
//
Функция СвойстваОбъекта(ВладелецСвойств, ПолучатьДопРеквизиты = Истина, ПолучатьДопСведения = Истина) Экспорт
	
	Если НЕ (ПолучатьДопРеквизиты ИЛИ ПолучатьДопСведения) Тогда
		Возврат Новый Массив;
	КонецЕсли;
	
//	ПолучатьДопСведения = ПолучатьДопСведения И ПравоДоступа("Чтение", Метаданные.РегистрыСведений.ДополнительныеСведения);
	
	УстановитьПривилегированныйРежим(Истина);
	НаборыСвойствОбъекта = УправлениеСвойствамиСлужебный.ПолучитьНаборыСвойствОбъекта(
		ВладелецСвойств);
	УстановитьПривилегированныйРежим(Ложь);
	
	МассивНаборовСвойствОбъекта = НаборыСвойствОбъекта.ВыгрузитьКолонку("Набор");
	
	ТекстЗапросаДопРеквизиты = 
		"ВЫБРАТЬ
		|	ТаблицаСвойств.Свойство КАК Свойство
		|ИЗ
		|	Справочник.НаборыДополнительныхРеквизитовИСведений.ДополнительныеРеквизиты КАК ТаблицаСвойств
		|ГДЕ
		|	ТаблицаСвойств.Ссылка В (&МассивНаборовСвойствОбъекта)";
	
	ТекстЗапросаДопСведения = 
		"ВЫБРАТЬ РАЗРЕШЕННЫЕ
		|	ТаблицаСвойств.Свойство КАК Свойство
		|ИЗ
		|	Справочник.НаборыДополнительныхРеквизитовИСведений.ДополнительныеСведения КАК ТаблицаСвойств
		|ГДЕ
		|	ТаблицаСвойств.Ссылка В (&МассивНаборовСвойствОбъекта)";
	
	Запрос = Новый Запрос;
	
	Если ПолучатьДопРеквизиты И ПолучатьДопСведения Тогда
		
		Запрос.Текст = ТекстЗапросаДопСведения + "
		|
		| ОБЪЕДИНИТЬ ВСЕ
		|" + ТекстЗапросаДопРеквизиты;
		
	ИначеЕсли ПолучатьДопРеквизиты Тогда
		Запрос.Текст = ТекстЗапросаДопРеквизиты;
		
	ИначеЕсли ПолучатьДопСведения Тогда
		Запрос.Текст = ТекстЗапросаДопСведения;
	КонецЕсли;
	
	Запрос.Параметры.Вставить("МассивНаборовСвойствОбъекта", МассивНаборовСвойствОбъекта);
	
	Результат = Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("Свойство");
	
	Возврат Результат;
	
КонецФункции

