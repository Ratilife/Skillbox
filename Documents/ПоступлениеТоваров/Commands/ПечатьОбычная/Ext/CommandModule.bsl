﻿
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	СформироватьПечатныйДокумент = ПечатьДокументаИзФормыНаСервере(ПараметрКоманды);
	СформироватьПечатныйДокумент.Показать();
КонецПроцедуры

&НаСервере
Функция ПечатьДокументаИзФормыНаСервере(ПараметрКоманды)
	Возврат Документы.ПоступлениеТоваров.ПечатьДокументаИзФормыНаСервере(ПараметрКоманды);
КонецФункции	

