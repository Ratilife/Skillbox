﻿&НаКлиенте
Функция НОД(Число_m,Число_n)
	m = Число_m;
	n = Число_n;
	шаг = 0;
	ПродолжениеЦикла = Истина;
	Пока ПродолжениеЦикла Цикл
		Если n > m Тогда
			Промежуточное_m	= n;
			n =  m;
			m = Промежуточное_m;
		КонецЕсли;
		ЦелоеЧисло = Цел(m/n);
		r = m - (n * ЦелоеЧисло);
		шаг = шаг+1;
		Если  r = 0 Тогда
			 Сообщить("Суммарное число выполнение шага "+ шаг);
			Возврат n;	
			ПродолжениеЦикла = Ложь;
		КонецЕсли;	
		m = n;
		n = r; 
		
	КонецЦикла;	
	       
КонецФункции	

&НаКлиенте
Процедура Расчет(Команда)
	Результат = НОД(Число1,Число2);
КонецПроцедуры
