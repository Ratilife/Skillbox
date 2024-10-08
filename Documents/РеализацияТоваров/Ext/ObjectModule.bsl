﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказКлиента") Тогда
		// Заполнение шапки
		Покупатель = ДанныеЗаполнения.Покупатель;
		Склад = ДанныеЗаполнения.Склад;
		Заказ = ДанныеЗаполнения.Ссылка;
		Для Каждого ТекСтрокаТовары Из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаТовары.Номенклатура;
			НоваяСтрока.Стоимость = ТекСтрокаТовары.Стоимость;
			НоваяСтрока.ЦенаРеализации = ТекСтрокаТовары.ЦенаРеализации;
		КонецЦикла;
	ИначеЕсли ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.РезервыТоваров") Тогда
		// Заполнение шапки
		Покупатель = ДанныеЗаполнения.Контрагент;
		РезервыТоваров = ДанныеЗаполнения.Ссылка;
		Для Каждого ТекСтрокаТовары Из ДанныеЗаполнения.Товары Цикл
			НоваяСтрока = Товары.Добавить();
			НоваяСтрока.Количество = ТекСтрокаТовары.Количество;
			НоваяСтрока.Номенклатура = ТекСтрокаТовары.Номенклатура;
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры

Процедура ПроверкаОстатковВложеныйЗапрос()
	Движения.ОстаткиТоваров.Записывать = Истина;
	// запрос для проверки отрицательных остатков
	// с использованием вложенного запроса	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ОстаткиТоваровОстатки.Товар,
	|	ОстаткиТоваровОстатки.КоличествоОстаток,
	|	Док.НомерСтроки,
	|	Док.Количество
	|ИЗ
	|	РегистрНакопления.ОстаткиТоваров.Остатки(
	|			&Момент,
	|			Товар В
	|					(ВЫБРАТЬ РАЗЛИЧНЫЕ
	|						РеализационнаяНакладнаяТовары.Товар
	|					ИЗ
	|						Документ.РеализационнаяНакладная.Товары КАК РеализационнаяНакладнаяТовары
	|					ГДЕ
	|						РеализационнаяНакладнаяТовары.Ссылка = &Ссылка)
	|				И Организация = &Организация
	|				И Склад = &Склад) КАК ОстаткиТоваровОстатки
	|		ВНУТРЕННЕЕ СОЕДИНЕНИЕ (ВЫБРАТЬ
	|			РеализационнаяНакладнаяТовары.Товар КАК Товар,
	|			МАКСИМУМ(РеализационнаяНакладнаяТовары.НомерСтроки) КАК НомерСтроки,
	|			СУММА(РеализационнаяНакладнаяТовары.Количество) КАК Количество
	|		ИЗ
	|			Документ.РеализационнаяНакладная.Товары КАК РеализационнаяНакладнаяТовары
	|		ГДЕ
	|			РеализационнаяНакладнаяТовары.Ссылка = &Ссылка
	|		
	|		СГРУППИРОВАТЬ ПО
	|			РеализационнаяНакладнаяТовары.Товар) КАК Док
	|		ПО ОстаткиТоваровОстатки.Товар = Док.Товар
	|ГДЕ
	|	ОстаткиТоваровОстатки.КоличествоОстаток < 0";
	Граница = Новый Граница (МоментВремени(), ВидГраницы.Включая);
	Запрос.УстановитьПараметр("Момент", Граница);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	Запрос.УстановитьПараметр("Организация", Организация);
	Запрос.УстановитьПараметр("Склад", Склад);

		
	РезультатЗапроса = Запрос.Выполнить();
	Если Не РезультатЗапроса.Пустой() Тогда
		
		Отказ = Истина;
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			// привязываем сообщение к строке
			Нехватка =  - ВыборкаДетальныеЗаписи.КоличествоОстаток;
			Если Нехватка>0 Тогда
				Сообщение = Новый СообщениеПользователю;
				Сообщение.Текст = "Нехватка товара "+ВыборкаДетальныеЗаписи.Товар + " в количестве " + Строка(-ВыборкаДетальныеЗаписи.КоличествоОстаток) ;
				Сообщение.Поле = "Товары["+(ВыборкаДетальныеЗаписи.НомерСтроки-1)+"].Количество";
				Сообщение.УстановитьДанные(ЭтотОбъект);
				Сообщение.Сообщить(); 
			КонецЕсли; 
		КонецЦикла;
	КонецЕсли; 


КонецПроцедуры	
Процедура ПроверкаОстатковПакетныйЗапрос()
	 //пакетный запрос
	 Запрос = Новый Запрос;
	 Запрос.Текст="ВЫБРАТЬ
	              |	РеализационнаяНакладнаяТовары.Товар,
	              |	СУММА(РеализационнаяНакладнаяТовары.Количество) КАК Количество,
	              |	МАКСИМУМ(РеализационнаяНакладнаяТовары.НомерСтроки) КАК НомерСтроки
	              |ПОМЕСТИТЬ ТоварыИзДокумента
	              |ИЗ
	              |	Документ.РеализационнаяНакладная.Товары КАК РеализационнаяНакладнаяТовары
	              |ГДЕ
	              |	РеализационнаяНакладнаяТовары.Ссылка = &Ссылка
	              |
	              |СГРУППИРОВАТЬ ПО
	              |	РеализационнаяНакладнаяТовары.Товар
	              |;
	              |
	              |////////////////////////////////////////////////////////////////////////////////
	              |ВЫБРАТЬ
	              |	ОстаткиТоваровОстатки.Товар,
	              |	ОстаткиТоваровОстатки.КоличествоОстаток
	              |ПОМЕСТИТЬ ОстаткиПоДокументу
	              |ИЗ
	              |	РегистрНакопления.ОстаткиТоваров.Остатки(
	              |			&Момент,
	              |			Организация = &Организация
	              |				И Склад = &Склад
	              |				И Товар В
	              |					(ВЫБРАТЬ
	              |						ТоварыИзДокумента.Товар
	              |					ИЗ
	              |						ТоварыИзДокумента КАК ТоварыИзДокумента)) КАК ОстаткиТоваровОстатки
	              |ГДЕ
	              |	ОстаткиТоваровОстатки.КоличествоОстаток < 0
	              |;
	              |
	              |////////////////////////////////////////////////////////////////////////////////
	              |ВЫБРАТЬ
	              |	ТоварыИзДокумента.Товар,
	              |	ТоварыИзДокумента.Количество,
	              |	ТоварыИзДокумента.НомерСтроки,
	              |	ОстаткиПоДокументу.КоличествоОстаток
	              |ИЗ
	              |	ТоварыИзДокумента КАК ТоварыИзДокумента
	              |		ВНУТРЕННЕЕ СОЕДИНЕНИЕ ОстаткиПоДокументу КАК ОстаткиПоДокументу
	              |		ПО ТоварыИзДокумента.Товар = ОстаткиПоДокументу.Товар";
	Граница = Новый Граница (МоментВремени(), ВидГраницы.Включая);
	Запрос.УстановитьПараметр("Момент", Граница);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	Запрос.УстановитьПараметр("Организация", Организация);
	Запрос.УстановитьПараметр("Склад", Склад);
	
	РезультатЗапроса = Запрос.Выполнить();
	Если Не РезультатЗапроса.Пустой() Тогда
		
		Отказ = Истина;
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			// привязываем сообщение к строке
			Нехватка =  - ВыборкаДетальныеЗаписи.КоличествоОстаток;
			Если Нехватка>0 Тогда
				Сообщение = Новый СообщениеПользователю;
				Сообщение.Текст = "Нехватка товара "+ВыборкаДетальныеЗаписи.Товар + " в количестве " + Строка(-ВыборкаДетальныеЗаписи.КоличествоОстаток) ;
				Сообщение.Поле = "Товары["+(ВыборкаДетальныеЗаписи.НомерСтроки-1)+"].Количество";
				Сообщение.УстановитьДанные(ЭтотОбъект);
				Сообщение.Сообщить(); 
			КонецЕсли; 
		КонецЦикла;
	КонецЕсли; 	 
КонецПроцедуры	
Процедура ОбработкаПроведения(Отказ, Режим)
	// регистр Хозяйственный 
	Движения.Хозяйственный.Записывать = Истина;
		
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РеализацияТоваровТовары.Ссылка.Дата                                   КАК Период,
		|	СУММА(РеализацияТоваровТовары.Стоимость)                              КАК Сумма,
		|	ЗНАЧЕНИЕ(ПланСчетов.Хозрасчетный.РасчетыСПокупателями)                КАК СчетДт,
		|	РеализацияТоваровТовары.Ссылка.Покупатель                             КАК СубконтоДт1,
		|	ЗНАЧЕНИЕ(ПланВидовХарактеристик.ВидыСубконто.Контрагент)              КАК ВидСубконтоДт1,
		|	РеализацияТоваровТовары.Ссылка.Договор                                КАК СубконтоДт2,
		|	ЗНАЧЕНИЕ(ПланВидовХарактеристик.ВидыСубконто.Договор)                 КАК ВидСубконтоДт2,
		|	ЗНАЧЕНИЕ(ПланСчетов.Хозрасчетный.Выручка)                             КАК СчетКт,
		|	РеализацияТоваровТовары.Номенклатура.ВидНоменклатуры                  КАК СубконтоКт1,
		|	ЗНАЧЕНИЕ(ПланВидовХарактеристик.ВидыСубконто.ВидНоменклатуры)         КАК ВидСубконтоКт1
		|ИЗ
		|	Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары
		|ГДЕ
		|	РеализацияТоваровТовары.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	РеализацияТоваровТовары.Ссылка.Дата,
		|	РеализацияТоваровТовары.Ссылка.Договор,
		|	РеализацияТоваровТовары.Номенклатура.ВидНоменклатуры,
		|	РеализацияТоваровТовары.Ссылка.Покупатель";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	Движения.Хозяйственный.Записывать = Истина;
	движения.Хозяйственный.Загрузить(РезультатЗапроса.Выгрузить());
		
	#Область коментарий
	//Для Каждого ТекСтрокаТовары Из Товары Цикл
	//	Движение = Движения.Хозяйственный.Добавить();
	//	Движение.СчетКт = ПланыСчетов.Хозрасчетный.Выручка;
	//	Движение.СчетДт = ПланыСчетов.Хозрасчетный.РасчетыСПокупателями;
	//	Движение.Период = Дата;
	//	Движение.Сумма = ТекСтрокаТовары.Стоимость;
	//	Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто.ВидНоменклатуры] = ТекСтрокаТовары.Номенклатура.ВидНоменклатуры;
	//	Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Контрагент] = Покупатель;
	//	Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто.Договор] = Договор;
	//	
	//	
	//КонецЦикла;
	#КонецОбласти
	// регистр ОбъемыПродажь 
	Движения.Продажи.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
			Движение = Движения.Продажи.Добавить();
			Движение.Период = Дата;
			Движение.Склады = Склад;
			Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
			Движение.Стоимость = ТекСтрокаТовары.Стоимость;
			Движение.Количество = ТекСтрокаТовары.Количество;
			Движение.Покупатель = Покупатель;
		КонецЦикла;
	
	// регистр ОстаткиНаСкладе Расход
	Движения.ОстаткиНаСкладе.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Если (ТекСтрокаТовары.Номенклатура.ВидНоменклатуры = Справочники.ВибыНоменклатура.Товар)
			ИЛИ (ТекСтрокаТовары.Номенклатура.ВидНоменклатуры = Справочники.ВибыНоменклатура.ПустаяСсылка()) Тогда
			Движение = Движения.ОстаткиНаСкладе.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
			Движение.Период = Дата;
			Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
			Движение.Склады = Склад;
			Движение.Характеристика = ТекСтрокаТовары.Характеристика;
			Движение.Количество = ТекСтрокаТовары.Количество;
		КонецЕсли;
	КонецЦикла;
		//Проверка остатка на складе 
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ОстаткиНаСкладеОстатки.Номенклатура КАК Номенклатура,
		|	ЕСТЬNULL(ОстаткиНаСкладеОстатки.КоличествоОстаток, 0) КАК КоличествоОстаток
		|ИЗ
		|	РегистрНакопления.ОстаткиНаСкладе.Остатки(, Номенклатура В (&Товары)) КАК ОстаткиНаСкладеОстатки
		|ГДЕ
		|	ОстаткиНаСкладеОстатки.КоличествоОстаток < 0";
	
	Запрос.УстановитьПараметр("Товары", Товары);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Выборка = РезультатЗапроса.Выбрать();
	
	Если Выборка.Следующий() Тогда
			Отказ = Истина;
			Пока Выборка.Следующий() Цикл
				 Сообщить("Недостаточно товара "+ Выборка.Номенклатура+" ! нехватает: "+ -Выборка.КоличествоОстаток+" !" );
			КонецЦикла;	
	КонецЕсли;

	
	// регистр ОстаткиТоваров Расход
	Движения.ОстаткиТоваров.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Количество = ТекСтрокаТовары.Количество;
		Движение.Сумма = ТекСтрокаТовары.СтоимостьСоСкидкой;
	КонецЦикла;

	// регистр Резервы Расход
	Движения.Резервы.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.Резервы.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Количество = ТекСтрокаТовары.Количество;   
		
		// Запись движения по регистру 	 СобранныеСБ   
		Если ТекСтрокаТовары.Номенклатура.СистемныйБлок = истина Тогда
			Движения.СобранныеСБ.Записывать=Истина;
			Движение = Движения.СобранныеСБ.Добавить();
			Движение.ВидДвижения=ВидДвиженияНакопления.Расход;
			Движение.Период = Дата;
			Движение.Регистратор = Ссылка;
			Движение.СБ = ТекСтрокаТовары.Номенклатура;
			Движение.Склад = Склад;
			Движение.Количество = ТекСтрокаТовары.Количество;
			Движение.Стоимость = ТекСтрокаТовары.Стоимость;
			Движение.Мастер = Мастер;
		КонецЕсли;
	КонецЦикла;
	
	// Запись движения по регистру ПродажиПроцентОтПродажиТоваров
	
	    // 1. Установка маркера Записи у регистра 
		Движения.Продажи.Записывать = Истина;
		
		// 2. Движения по регистру
		Движение = Движения.ПродажиПроцентОтПродажиТоваров.Добавить();
		Движение.Период = Дата;
		Движение.Подразделение = Подразделение;
		Движение.СуммаПродаж = СуммаДокумента;
		
	КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	СуммаДокумента = Товары.Итог("Стоимость");
КонецПроцедуры

Процедура ПриЗаписи(Отказ)
	
	// регистр ИтогиПоДокументам 
	Движения.ИтогиПоДокументам.Записывать = Истина;
	Движение = Движения.ИтогиПоДокументам.Добавить();
	Движение.Период = Дата;
	Движение.Контрагент = Покупатель;
	Движение.Автор = ПараметрыСеанса.ТекущийПользователь;
	Движение.Сумма = Товары.Итог("Стоимость");

КонецПроцедуры

 
	
	