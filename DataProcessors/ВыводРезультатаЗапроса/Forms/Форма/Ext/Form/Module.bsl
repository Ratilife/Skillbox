﻿
&НаСервере
Процедура ВыбратьКонтрагентовНаСервере()
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.ВыводРезультатаЗапроса.ПолучитьМакет("Макет1");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Контрагенты.Ссылка КАК Ссылка,
		|	Контрагенты.Представление КАК Представление,
		|	Контрагенты.Признак КАК Признак,
		|	Контрагенты.ЕДРПОУ КАК ЕДРПОУ,
		|	Контрагенты.ПолноеЮридическоеНаименование КАК ПолноеЮридическоеНаименование
		|ИЗ
		|	Справочник.Контрагенты КАК Контрагенты";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	ОбластьПодвал = Макет.ПолучитьОбласть("Подвал");
	ОбластьШапкаТаблицы = Макет.ПолучитьОбласть("ШапкаТаблицы");
	ОбластьПодвалТаблицы = Макет.ПолучитьОбласть("ПодвалТаблицы");
	ОбластьДетальныхЗаписей = Макет.ПолучитьОбласть("Детали");
	
	ТабДок.Очистить();
	ТабДок.Вывести(ОбластьЗаголовок);
	ТабДок.Вывести(ОбластьШапкаТаблицы);
	ТабДок.НачатьАвтогруппировкуСтрок();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		ОбластьДетальныхЗаписей.Параметры.Заполнить(ВыборкаДетальныеЗаписи);
		ТабДок.Вывести(ОбластьДетальныхЗаписей, ВыборкаДетальныеЗаписи.Уровень());
	КонецЦикла;
	
	ТабДок.ЗакончитьАвтогруппировкуСтрок();
	ТабДок.Вывести(ОбластьПодвалТаблицы);
	ТабДок.Вывести(ОбластьПодвал);
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
КонецПроцедуры

&НаКлиенте
Процедура ВыбратьКонтрагентов(Команда)
	ВыбратьКонтрагентовНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВывестиДокументыНаСервере()
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.ВыводРезультатаЗапроса.ПолучитьМакет("Макет2");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваров.Номенклатура КАК Товар,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваров.Номенклатура) КАК НоменклатураПредставление,
		|	ПоступлениеТоваров.Ссылка.Поставщик КАК Контрагент,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваров.Ссылка.Поставщик) КАК ПоставщикПредставление,
		|	ПоступлениеТоваров.Количество КАК Количество,
		|	ПоступлениеТоваров.Стоимость КАК Сумма,
		|	ПоступлениеТоваров.ЦенаПоступления КАК ЦенаПоступления
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваров
		|ИТОГИ
		|	СУММА(Количество),
		|	СУММА(Сумма)
		|ПО
		|	ОБЩИЕ,
		|	Товар,
		|	Контрагент";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	ОбластьПодвал = Макет.ПолучитьОбласть("Подвал");
	ОбластьШапкаТаблицы = Макет.ПолучитьОбласть("ШапкаТаблицы");
	ОбластьПодвалТаблицы = Макет.ПолучитьОбласть("ПодвалТаблицы");
	ОбластьОбщийИтог = Макет.ПолучитьОбласть("ОбщиеИтоги");
	ОбластьТовар = Макет.ПолучитьОбласть("Товар");
	ОбластьКонтрагент = Макет.ПолучитьОбласть("Контрагент");
	ОбластьДетальныхЗаписей = Макет.ПолучитьОбласть("Детали");
	
	ТабДок.Очистить();
	ТабДок.Вывести(ОбластьЗаголовок);
	ТабДок.Вывести(ОбластьШапкаТаблицы);
	ТабДок.НачатьАвтогруппировкуСтрок();
	
	ВыборкаОбщийИтог = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	ВыборкаОбщийИтог.Следующий();		// Общий итог
	ОбластьОбщийИтог.Параметры.Заполнить(ВыборкаОбщийИтог);
	ТабДок.Вывести(ОбластьОбщийИтог, ВыборкаОбщийИтог.Уровень());
	
	ВыборкаТовар = ВыборкаОбщийИтог.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаТовар.Следующий() Цикл
		ОбластьТовар.Параметры.Заполнить(ВыборкаТовар);
		ТабДок.Вывести(ОбластьТовар, ВыборкаТовар.Уровень());
	
		ВыборкаКонтрагент = ВыборкаТовар.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
		Пока ВыборкаКонтрагент.Следующий() Цикл
			ОбластьКонтрагент.Параметры.Заполнить(ВыборкаКонтрагент);
			ТабДок.Вывести(ОбластьКонтрагент, ВыборкаКонтрагент.Уровень());
	
			ВыборкаДетальныеЗаписи = ВыборкаКонтрагент.Выбрать();
	
			Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
				ОбластьДетальныхЗаписей.Параметры.Заполнить(ВыборкаДетальныеЗаписи);
				ТабДок.Вывести(ОбластьДетальныхЗаписей, ВыборкаДетальныеЗаписи.Уровень());
			КонецЦикла;
		КонецЦикла;
	КонецЦикла;
	
	ТабДок.ЗакончитьАвтогруппировкуСтрок();
	ТабДок.Вывести(ОбластьПодвалТаблицы);
	ТабДок.Вывести(ОбластьПодвал);
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
КонецПроцедуры

&НаКлиенте
Процедура ВывестиДокументы(Команда)
	ВывестиДокументыНаСервере();
КонецПроцедуры
