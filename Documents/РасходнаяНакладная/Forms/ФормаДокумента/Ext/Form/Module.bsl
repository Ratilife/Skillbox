﻿&НаСервере
Функция НайтиСклад()
	Возврат Объект.Склад;
КонецФункции	
&НаКлиенте
Процедура ТоварыНоменклатураНачалоВыбора(Элемент, ДанныеВыбора, ВыборДобавлением, СтандартнаяОбработка)
	Отбор = Новый Структура("Склад",Объект.НайтиСклад());
	ПараметрыОтбора =  Новый Структура("Отбор",Отбор);
	ОткрытьФорму("Справочник.Номенклатура.ФормаВыбора",ПараметрыОтбора); 
КонецПроцедуры
