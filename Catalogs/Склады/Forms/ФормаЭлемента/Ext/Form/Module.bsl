﻿
&НаКлиенте
Процедура ПоказатьТекущуюДату(Команда)
	Сообщить(ТекущаяДата());
КонецПроцедуры

&НаКлиенте
Процедура ВидСкладаПриИзменении(Элемент)
	Если Объект.ВидСклада = 1 Тогда
		Если ЗначениеЗаполнено(Объект.МестоРасположения) Тогда
			Сообщение = Новый СообщениеПользователю;
			Сообщение.Текст = "Необходимо ввести место расположения";
		    Сообщение.Поле = "Объект.МестоРасположения";
			Сообщение.Сообщить();
			ЭтотОбъект.ТекущийЭлемент = Элементы.МестоРасположения;
		КонецЕсли;   
	КонецЕсли;	
КонецПроцедуры


&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ЕстьДубль = Ложь;
КонецПроцедуры


&НаКлиенте
Процедура ПередЗакрытием(Отказ, ЗавершениеРаботы, ТекстПредупреждения, СтандартнаяОбработка)
	//Если Вопрос("Вы уверены, что необходимо закрыть форму?",РежимДиалогаВопрос.ДаНет,,,"Вопрос")Тогда 
	//	Отказ = Истина;
	//КонецЕсли;	
		
КонецПроцедуры

