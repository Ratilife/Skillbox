﻿
Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	// Вставить содержимое обработчика.
		Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ПланВидовРасчета1.Ссылка
		|ИЗ
		|	ПланВидовРасчета.ПланВидовРасчета1 КАК ПланВидовРасчета1
		|ГДЕ
		|	ПланВидовРасчета1.Код = &Код
		|	И ПланВидовРасчета1.Ссылка <> &Ссылка";

	Запрос.УстановитьПараметр("Код", Код);
	Запрос.УстановитьПараметр("Ссылка", Ссылка);

	Результат = Запрос.Выполнить();
	
	Если Не Результат.Пустой() Тогда
	
		Отказ = Истина;
		ВыборкаДетальныеЗаписи = Результат.Выбрать();

		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Элемент с кодом "+Код+" - "+ВыборкаДетальныеЗаписи.Ссылка;
			Сообщение.Сообщить(); 
			
		КонецЦикла;
		
	
	КонецЕсли; 


КонецПроцедуры
