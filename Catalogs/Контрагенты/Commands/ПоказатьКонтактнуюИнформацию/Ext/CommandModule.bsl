﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	Для каждого ЭлементМассива из ПараметрКоманды Цикл
		 Сообщить("Контакты контрагента "+ЭлементМассива);
		 СписокКонтактов =   ПоказатьКонтактыНаСервере(ЭлементМассива);
		 Сообщить(СписокКонтактов);
	КонецЦикла;	
КонецПроцедуры
&НаСервере
Функция ПоказатьКонтактыНаСервере(ТекКонтрагент)
	СтрокаДляВозврата = "";
	Если ТекКонтрагент.Контакты.Количество() > 0 Тогда 
		Если ЗначениеЗаполнено(СтрокаДляВозврата) Тогда
			СтрокаДляВозврата = СтрокаДляВозврата + Символы.ПС;
		КонецЕсли;	
		Для Каждого СтрокаКонтакта из ТекКонтрагент.Контакты Цикл
			   СтрокаДляВозврата = СтрокаДляВозврата+ " Телефон: " + СтрокаКонтакта.Телефон+"; "
			   + " Мобильный "+ СтрокаКонтакта.Мобильный+"; ";
		КонецЦикла;
	КонецЕсли;
	Возврат СтрокаДляВозврата;
КонецФункции	