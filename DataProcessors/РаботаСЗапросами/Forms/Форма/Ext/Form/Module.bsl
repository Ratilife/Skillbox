﻿
&НаСервере
Процедура ВыводКонтрагентовНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет1");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Контрагенты.Ссылка КАК Ссылка,
		|	Контрагенты.Представление КАК Представление,
		|	Контрагенты.Код КАК Код,
		|	Контрагенты.Наименование КАК Наименование,
		|	Контрагенты.ИНН КАК ИНН,
		|	Контрагенты.ДатаРеистрации КАК ДатаРеистрации,
		|	Контрагенты.ЕДРПОУ КАК ЕДРПОУ,
		|	Контрагенты.Представление КАК Представление1,
		|	ВЫБОР
		|		КОГДА Контрагенты.Признак = ЗНАЧЕНИЕ(Перечисление.ПризнакКлиента.ЧастноеЛицо)
		|			ТОГДА ""Необходимо поздравить""
		|		ИНАЧЕ """"
		|	КОНЕЦ КАК Поздравление
		|ИЗ
		|	Справочник.Контрагенты КАК Контрагенты
		|ГДЕ
		|	Контрагенты.ЭтоГруппа = ЛОЖЬ";
	
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
Процедура ВыводКонтрагентов(Команда)
	ВыводКонтрагентовНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЧастныеЛицаНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет2");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	Контрагенты.Ссылка КАК Ссылка,
		|	Контрагенты.Представление КАК Представление,
		|	Контрагенты.Код КАК Код,
		|	Контрагенты.Признак КАК Признак
		|ИЗ
		|	Справочник.Контрагенты КАК Контрагенты
		|ГДЕ
		|	Контрагенты.Признак = ЗНАЧЕНИЕ(Перечисление.ПризнакКлиента.ЧастноеЛицо)";
	
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
Процедура ЧастныеЛица(Команда)
	ЧастныеЛицаНаСервере();
КонецПроцедуры

&НаСервере
Процедура КоличествоРазличныхТоваровНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет3");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РеализацияТоваровТовары.Ссылка.Покупатель КАК Покупатель,
		|	КОЛИЧЕСТВО(РАЗЛИЧНЫЕ РеализацияТоваровТовары.Номенклатура) КАК КоличествоРазличныхТоваров
		|ИЗ
		|	Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары
		|
		|СГРУППИРОВАТЬ ПО
		|	РеализацияТоваровТовары.Ссылка.Покупатель";
	
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
Процедура КоличествоРазличныхТоваров(Команда)
	КоличествоРазличныхТоваровНаСервере();
КонецПроцедуры

&НаСервере
Процедура ВыбратьТоварыНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет31");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ РАЗЛИЧНЫЕ
		|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Номенклатура) КАК НоменклатураПредставление,
		|	ПоступлениеТоваровТовары.ЦенаПоступления КАК ЦенаПоступления
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
		|
		|УПОРЯДОЧИТЬ ПО
		|	ЦенаПоступления";
	
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
Процедура ВыбратьТовары(Команда)
	ВыбратьТоварыНаСервере();
КонецПроцедуры

&НаСервере
Процедура ТоварыИзДокументаПоступленияНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет5");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваровТовары.Ссылка КАК Ссылка,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Ссылка) КАК СсылкаПредставление,
		|	ПоступлениеТоваровТовары.НомерСтроки КАК НомерСтроки,
		|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Номенклатура) КАК НоменклатураПредставление,
		|	ПоступлениеТоваровТовары.Характеристика КАК Характеристика,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Характеристика) КАК ХарактеристикаПредставление,
		|	ПоступлениеТоваровТовары.Количество КАК Количество,
		|	ПоступлениеТоваровТовары.ЦенаПоступления КАК ЦенаПоступления,
		|	ПоступлениеТоваровТовары.Стоимость КАК Стоимость,
		|	ПоступлениеТоваровТовары.Ссылка.Дата КАК Дата,
		|	ПоступлениеТоваровТовары.Ссылка.Поставщик КАК Поставщик,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Ссылка.Поставщик) КАК ПоставщикПредставление
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары";
	
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
Процедура ТоварыИзДокументаПоступления(Команда)
	ТоварыИзДокументаПоступленияНаСервере();
КонецПроцедуры

&НаСервере
Процедура КоличествоПоставщиковПоТоваруНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет6");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Номенклатура) КАК НоменклатураПредставление,
		|	СУММА(ПоступлениеТоваровТовары.Количество) КАК Количество,
		|	СУММА(ПоступлениеТоваровТовары.Стоимость) КАК Стоимость,
		|	КОЛИЧЕСТВО(РАЗЛИЧНЫЕ ПоступлениеТоваровТовары.Ссылка.Поставщик) КАК КоличествоПоставщиков
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
		|
		|СГРУППИРОВАТЬ ПО
		|	ПоступлениеТоваровТовары.Номенклатура";
	
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
Процедура КоличествоПоставщиковПоТовару(Команда)
	КоличествоПоставщиковПоТоваруНаСервере();
КонецПроцедуры

&НаСервере
Процедура КоличествоРазлчныхТоваровПоПоставщикамНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет7");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КОЛИЧЕСТВО(РАЗЛИЧНЫЕ ПоступлениеТоваровТовары.Номенклатура) КАК КоличествоРазличныхТоваров,
		|	ПоступлениеТоваровТовары.Ссылка.Поставщик КАК Поставщик
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
		|
		|СГРУППИРОВАТЬ ПО
		|	ПоступлениеТоваровТовары.Ссылка.Поставщик";
	
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
Процедура КоличествоРазлчныхТоваровПоПоставщикам(Команда)
	КоличествоРазлчныхТоваровПоПоставщикамНаСервере();
КонецПроцедуры

&НаСервере
Процедура ПоследняяДатаПриходаНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет8");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Номенклатура) КАК НоменклатураПредставление,
		|	МАКСИМУМ(ПоступлениеТоваровТовары.Ссылка.Дата) КАК ПоследняяДатаПрихода
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
		|
		|СГРУППИРОВАТЬ ПО
		|	ПоступлениеТоваровТовары.Номенклатура";
	
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
Процедура ПоследняяДатаПрихода(Команда)
	ПоследняяДатаПриходаНаСервере();
КонецПроцедуры

&НаСервере
Процедура МинМахЦеныНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет9");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПоступлениеТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПРЕДСТАВЛЕНИЕ(ПоступлениеТоваровТовары.Номенклатура) КАК НоменклатураПредставление,
		|	МИНИМУМ(ПоступлениеТоваровТовары.ЦенаПоступления) КАК ЦенаПоступленияМинимальная,
		|	МАКСИМУМ(ПоступлениеТоваровТовары.ЦенаПоступления) КАК ЦенаПоступленияМаксимальная
		|ИЗ
		|	Документ.ПоступлениеТоваров.Товары КАК ПоступлениеТоваровТовары
		|
		|СГРУППИРОВАТЬ ПО
		|	ПоступлениеТоваровТовары.Номенклатура";
	
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
Процедура МинМахЦены(Команда)
	МинМахЦеныНаСервере();
КонецПроцедуры

&НаСервере
Процедура ДанныеПоРеализацииНаСервере()
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Макет = Обработки.РаботаСЗапросами.ПолучитьМакет("Макет10");
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РеализацияТоваровТовары.Ссылка.Покупатель КАК Покупатель,
		|	РеализацияТоваровТовары.Номенклатура КАК Номенклатура,
		|	ПРЕДСТАВЛЕНИЕ(РеализацияТоваровТовары.Номенклатура) КАК НоменклатураПредставление,
		|	РеализацияТоваровТовары.Количество КАК Количество,
		|	РеализацияТоваровТовары.ЦенаРеализации КАК ЦенаРеализации,
		|	РеализацияТоваровТовары.Стоимость КАК Стоимость
		|ИЗ
		|	Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары
		|ИТОГИ
		|	СУММА(Количество),
		|	СУММА(Стоимость)
		|ПО
		|	Покупатель";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	ОбластьПодвал = Макет.ПолучитьОбласть("Подвал");
	ОбластьШапкаТаблицы = Макет.ПолучитьОбласть("ШапкаТаблицы");
	ОбластьПодвалТаблицы = Макет.ПолучитьОбласть("ПодвалТаблицы");
	ОбластьПокупатель = Макет.ПолучитьОбласть("Покупатель");
	ОбластьДетальныхЗаписей = Макет.ПолучитьОбласть("Детали");
	
	ТабДок.Очистить();
	ТабДок.Вывести(ОбластьЗаголовок);
	ТабДок.Вывести(ОбластьШапкаТаблицы);
	ТабДок.НачатьАвтогруппировкуСтрок();
	
	ВыборкаПокупатель = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаПокупатель.Следующий() Цикл
		ОбластьПокупатель.Параметры.Заполнить(ВыборкаПокупатель);
		ТабДок.Вывести(ОбластьПокупатель, ВыборкаПокупатель.Уровень());
	
		ВыборкаДетальныеЗаписи = ВыборкаПокупатель.Выбрать();
	
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			ОбластьДетальныхЗаписей.Параметры.Заполнить(ВыборкаДетальныеЗаписи);
			ТабДок.Вывести(ОбластьДетальныхЗаписей, ВыборкаДетальныеЗаписи.Уровень());
		КонецЦикла;
	КонецЦикла;
	
	ТабДок.ЗакончитьАвтогруппировкуСтрок();
	ТабДок.Вывести(ОбластьПодвалТаблицы);
	ТабДок.Вывести(ОбластьПодвал);
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

КонецПроцедуры

&НаКлиенте
Процедура ДанныеПоРеализации(Команда)
	ДанныеПоРеализацииНаСервере();
КонецПроцедуры
