﻿
&НаСервере
Процедура ЗаполнитьНаСервере()
	ТекДата = НачалоГода(ДатаГрафика);
	ДатаНачалаГода = НачалоГода(ДатаГрафика);
	Набор = РегистрыСведений.ГрафикРаботы.СоздатьНаборЗаписей();
	Набор.Отбор.ТипГрафика.Установить(ТипГрафика);
	Набор.Отбор.ДатаНачалаГода.Установить(ТекДата);
	Для каждого СтрокаТаблицы Из ДатыДляНабораЗаписей Цикл
		
		Запись = Набор.Добавить();
		Запись.Дата = СтрокаТаблицы.Дата;
		Запись.ДатаНачалаГода = ДатаНачалаГода;
		Запись.ТипГрафика = ТипГрафика;
		Запись.Значение = СтрокаТаблицы.Значение;
		
		
	КонецЦикла;
	Набор.Записать();
КонецПроцедуры

&НаКлиенте
Процедура Заполнить(Команда)
	ЗаполнитьНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура КалендарьВыбор(Элемент, ВыбраннаяДата)
	Отбор =  Новый Структура("Дата",ВыбраннаяДата );
	НайденныйСтроки = ДатыДляНабораЗаписей.НайтиСтроки(Отбор);
	Если НайденныйСтроки.Количество()<> 0 Тогда
	
	НайденныйСтроки[0].Значение =  8;
		
	// изменить цвет выбранной даты	
	
	КонецЕсли; 
КонецПроцедуры

&НаКлиенте
Процедура ДатаГрафикаПриИзменении(Элемент)
	ТекДата = НачалоГода(ДатаГрафика);
	КонецГода = КонецГода(ДатаГрафика);
	Пока ТекДата<=КонецГода Цикл
		НоваяСтрока = ДатыДляНабораЗаписей.Добавить();
		НоваяСтрока.Дата =  ТекДата;
		
		ТекДата = ТекДата+24*3600;
	КонецЦикла;
	
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	Календарь = НачалоГода(ТекущаяДата());
КонецПроцедуры
