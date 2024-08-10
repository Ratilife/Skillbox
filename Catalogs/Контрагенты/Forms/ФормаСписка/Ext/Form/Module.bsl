﻿
&НаСервере
Процедура ПроверкаКонтрагентовНаСервере()
	Выборка = Справочники.Контрагенты.Выбрать();
	Пока Выборка.Следующий() Цикл
		Если Не Выборка.ЭтоГруппа Тогда
			Если Выборка.Контакты.Количество() = 0 Тогда
				Сообщить("У контрагента "+ Выборка.Наименование + " не заполненны контакты");
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;	
	
КонецПроцедуры

&НаКлиенте
Процедура ПроверкаКонтрагентов(Команда)
	ПроверкаКонтрагентовНаСервере();
КонецПроцедуры
