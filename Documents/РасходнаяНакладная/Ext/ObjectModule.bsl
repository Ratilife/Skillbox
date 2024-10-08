﻿
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	Движения.ОстаткиНаСкладе2.Записать();
	
	Движения.ОстаткиНаСкладе2.Записывать = Истина;
	
	// блокировки	
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	РасходнаяНакладнаяТовары.Номенклатура КАК Номенклатура,
		|	РасходнаяНакладнаяТовары.Количество КАК Количество
		|ПОМЕСТИТЬ ВТ_ДокТЧ
		|ИЗ
		|	Документ.РасходнаяНакладная.Товары КАК РасходнаяНакладнаяТовары
		|ГДЕ
		|	РасходнаяНакладнаяТовары.Ссылка = &Ссылка
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	ВТ_ДокТЧ.Номенклатура КАК Номенклатура,
		|	МАКСИМУМ(ВТ_ДокТЧ.Количество) КАК Количество,
		|	ЕСТЬNULL(ОстаткиНаСкладе2Остатки.КоличествоОстаток, 0) КАК КоличествоОстаток,
		|	ОстаткиНаСкладе2Остатки.Партия КАК Партия,
		|	ЕСТЬNULL(ОстаткиНаСкладе2Остатки.СтоимостьОстаток, 0) КАК Стоимость,
		|	ОстаткиНаСкладе2Остатки.Склады КАК Склады
		|ИЗ
		|	ВТ_ДокТЧ КАК ВТ_ДокТЧ
		|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрНакопления.ОстаткиНаСкладе2.Остатки(
		|				&МоментВремени,
		|				Склады = &Склад
		|					И Номенклатура В
		|						(ВЫБРАТЬ
		|							ВТ_ДокТЧ.Номенклатура КАК Номенклатура
		|						ИЗ
		|							ВТ_ДокТЧ КАК ВТ_ДокТЧ)) КАК ОстаткиНаСкладе2Остатки
		|		ПО ВТ_ДокТЧ.Номенклатура = ОстаткиНаСкладе2Остатки.Номенклатура
		|
		|СГРУППИРОВАТЬ ПО
		|	ВТ_ДокТЧ.Номенклатура,
		|	ОстаткиНаСкладе2Остатки.Партия,
		|	ЕСТЬNULL(ОстаткиНаСкладе2Остатки.КоличествоОстаток, 0),
		|	ЕСТЬNULL(ОстаткиНаСкладе2Остатки.СтоимостьОстаток, 0),
		|	ОстаткиНаСкладе2Остатки.Склады
		|
		|УПОРЯДОЧИТЬ ПО
		|	ОстаткиНаСкладе2Остатки.Партия.Дата
		|ИТОГИ
		|	МАКСИМУМ(Количество)
		|ПО
		|	ОБЩИЕ,
		|	Номенклатура";
	
	Запрос.УстановитьПараметр("МоментВремени", МоментВремени());
	Запрос.УстановитьПараметр("Склад", Склад);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаОбщийИтог = РезультатЗапроса.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	ВыборкаОбщийИтог.Следующий();		// Общий итог
	
	// Вставить обработку выборки ВыборкаОбщийИтог
	
	ВыборкаНоменклатура = ВыборкаОбщийИтог.Выбрать(ОбходРезультатаЗапроса.ПоГруппировкам);
	
	Пока ВыборкаНоменклатура.Следующий() Цикл
		ОсталосьСписать = ВыборкаНоменклатура.Количество ;
	
		ВыборкаДетальныеЗаписи = ВыборкаНоменклатура.Выбрать();
	
		Пока ВыборкаДетальныеЗаписи.Следующий() И ОсталосьСписать > 0 Цикл
			Движение = Движения.ОстаткиНаСкладе2.Добавить();
			Движение.Период = Дата; 
			Движение.ВидДвижения=ВидДвиженияНакопления.Расход;
			Движение.Номенклатура = ВыборкаДетальныеЗаписи.Номенклатура;
			Движение.Склады = ВыборкаДетальныеЗаписи.Склады;  	
			Движение.Количество = МИН(ОсталосьСписать,ВыборкаДетальныеЗаписи.КоличествоОстаток);  
			Движение.Партия = ВыборкаДетальныеЗаписи.Партия;
			Если Движение.Количество = ВыборкаДетальныеЗаписи.КоличествоОстаток Тогда
				Движение.Стоимость = ВыборкаДетальныеЗаписи.Стоимость;
            Иначе
				Движение.Стоимость = Движение.Количество / ВыборкаДетальныеЗаписи.Стоимость * ВыборкаДетальныеЗаписи.КоличествоОстаток;
			
			КонецЕсли;
			ОсталосьСписать = ОсталосьСписать - Движение.Количество;
		КонецЦикла;
	КонецЦикла;
	
	

КонецПроцедуры
