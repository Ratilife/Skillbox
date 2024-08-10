﻿
&НаСервере
Процедура ЧтениеКонстантыНаСервере()
	Для Каждого ТекущаяКонстанта из Константы Цикл 
		 Сообщить(""+ТекущаяКонстанта+" - "+ТекущаяКонстанта.Получить());
	КонецЦикла;	
	ТокенДФС = Константы.ТокенДФС.Получить();
	Организация = Константы.НазваниеОрганизации.Получить();
	МояКонстанта = Константы.АдресСервераЭлектронногоКабинетаНалоговой.Получить();
КонецПроцедуры

&НаКлиенте
Процедура ЧтениеКонстанты(Команда)
	ЧтениеКонстантыНаСервере();
КонецПроцедуры

&НаСервере
Процедура УстановкаКонстантыНаСервере()
	Константы.НазваниеОрганизации.Установить(ОсновнаяОрганизация);
КонецПроцедуры

&НаКлиенте
Процедура УстановкаКонстанты(Команда)
	УстановкаКонстантыНаСервере();
КонецПроцедуры
