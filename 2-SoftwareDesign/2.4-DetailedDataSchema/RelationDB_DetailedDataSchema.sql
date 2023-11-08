CREATE TABLE Users( -- опис користувача
	userno int, -- номер користувача
	full_name VARCHAR(200), -- ПІБ користувача
	date_of_birth DATE, -- Дата народження 
	gender VARCHAR(100) -- Стать 
);

CREATE TABLE OfficeEmployee( -- опис офісного співробітника
	officeemployeeno int, -- номер офісного співробітника
	full_name VARCHAR(200), -- ПІБ офісного співробітника
	date_of_birth DATE, -- Дата народження 
	gender VARCHAR(100), -- Стать 
	salary DECIMAL, -- Заробітна плата 
	pos_of_off_employee VARCHAR(100) -- Посада
);

CREATE TABLE TechnicalEmployee( -- опис технічного співробітника
	technicalemployeeno int, -- номер технічного співробітника
	full_name VARCHAR(100), -- ПІБ технічного співробітника
	date_of_birth DATE, -- Дата народження
	gender VARCHAR(50), -- Стать
	salary DECIMAL, -- Заробітна плата 
	pos_of_tech_employee VARCHAR(100) -- Посада 
);

CREATE TABLE InformationRequest( -- опис запиту на інформацію
	informationrequestno int, -- номер запиту
	request_title VARCHAR(1000), -- заголовок запиту
	description VARCHAR(2000), -- детальний опис запиту
	format VARCHAR(100), -- формат отримання результату
	date DATE, -- дата відправки запиту
	userno int -- номер користувач, який надіслав запит
);

CREATE TABLE InformationAnswer( -- опис відповіді на запит інформації
	informationanswerno int, -- номер відповіді
	answer_title VARCHAR(1000), -- заголовок відповіді
	answer_information VARCHAR(10000), -- відповідь у вигляді інформації
	file VARCHAR(200), -- посилання на місце зберігання файлу з відповіддю 
	date DATE, -- дата надсилання відповіді
	informationrequestno int, -- номер запиту, на який надсилається відповідь
	officeemployeeno int -- номер офісного співробітника, який сформував відповідь
);

CREATE TABLE Temperature( -- опис поточного градуса температури
	temperatureno int, -- номер показника градуса температури
	date DATE, -- дата проведення вимірювань
	time TIME, -- час проведення вимірювань
	temperature_degree DECIMAL, -- градуси температури
	location VARCHAR(200) -- місце проведення вимірювань
);

CREATE TABLE TemperatureChange( -- опис зміни температури
	temperaturechangeno int,  -- номер зміни температури
	new_temperature_degree DECIMAL,  -- значення температури, яке встановлюється
	location VARCHAR(100),  -- місце, де змінюється значення температури
	technicalemployeeno int,  -- номер технічного співробітника, який внес зміни
	temperatureno int  -- номер попереднього значення температури в цьому приміщенні
);

/* Команди обмеження цілісності даних */

/* Первинні ключі */
-- Встановлення обмеження первинного ключа користувача
ALTER TABLE Users ADD CONSTRAINT user_pk
    PRIMARY KEY (userno);
	
-- Встановлення обмеження первинного ключа офісного співробітника
ALTER TABLE OfficeEmployee ADD CONSTRAINT officeemployee_pk
    PRIMARY KEY (officeemployeeno);
	
-- Встановлення обмеження первинного ключа технічного співробітника
ALTER TABLE TechnicalEmployee ADD CONSTRAINT technicalemployee_pk
    PRIMARY KEY (technicalemployeeno);
	
-- Встановлення обмеження первинного ключа запиту на інформацію
ALTER TABLE InformationRequest ADD CONSTRAINT informationrequest_pk
    PRIMARY KEY (informationrequestno);
	
-- Встановлення обмеження первинного ключа відповіді на запит
ALTER TABLE InformationAnswer ADD CONSTRAINT informationanswer_pk
    PRIMARY KEY (informationanswerno);

-- Встановлення обмеження первинного ключа показника температури
ALTER TABLE Temperature ADD CONSTRAINT temperature_pk
    PRIMARY KEY (temperatureno);
	
-- Встановлення обмеження первинного ключа зміни температури
ALTER TABLE TemperatureChange ADD CONSTRAINT temperaturechange_pk
    PRIMARY KEY (temperaturechangeno);
	
/* Зовнішні ключі */	

-- Встановлення обмеження зовнішнього ключа на користувача для таблиці Запит на інформацію
ALTER TABLE InformationRequest ADD CONSTRAINT request_user_fk
    FOREIGN KEY (userno) REFERENCES Users(userno);

-- Встановлення обмеження зовнішнього ключа на запит для таблиці Відповідь на запит
ALTER TABLE InformationAnswer ADD CONSTRAINT answer_request_fk
    FOREIGN KEY (informationrequestno) REFERENCES InformationRequest(informationrequestno);
	
-- Встановлення обмеження зовнішнього ключа на офісного співробітника для таблці Відповідь на запит
ALTER TABLE InformationAnswer ADD CONSTRAINT answer_employee_fk
    FOREIGN KEY (officeemployeeno) REFERENCES OfficeEmployee(officeemployeeno);
	
-- Встановлення обмеження зовнішнього ключа на технічного співробітника для таблиці Зміна температури
ALTER TABLE TemperatureChange ADD CONSTRAINT temperature_employee_fk
    FOREIGN KEY (technicalemployeeno) REFERENCES TechnicalEmployee(technicalemployeeno);
	
-- Встановлення обмеження зовнішнього ключа на попереднє значення температури для таблиці Зміна температури
ALTER TABLE TemperatureChange ADD CONSTRAINT previous_temperature_fk
    FOREIGN KEY (temperatureno) REFERENCES Temperature(temperatureno);
	
/* Команди обмеження змісту атрибутів таблиць */

-- Встановлення обмеження вмісту стовпчика зарплатня таблиці Офісні співробітники, більше нуля
ALTER TABLE OfficeEmployee ADD CONSTRAINT office_salary_positive
    CHECK ( salary > 0 );
	
-- Встановлення обмеження вмісту стовпчика зарплатня таблиці Технічні співробітники, більше нуля
ALTER TABLE TechnicalEmployee ADD CONSTRAINT technical_salary_positive
    CHECK ( salary > 0 );
	
-- Встановлення обмеження вмісту стовпчика ПІБ файлу таблиці Користувача. 
ALTER TABLE Users
ADD CONSTRAINT full_name_positive
CHECK (full_name REGEXP_LIKE '^.[a-zA-Z- _]{3,200}');

-- Встановлення обмеження вмісту стовпчика Файл таблиці Відповідь на запит, який містить посилання на файл з інформацією.
ALTER TABLE InformationAnswer
ADD CONSTRAINT file_link_format
CHECK (file REGEXP_LIKE '^https://drive.google.com/drive/[^/]+/[^/]+$');
	
-- Встановлення обмеження вмісту стовпчика Показник температури таблиці температури
ALTER TABLE Temperature ADD CONSTRAINT temperature_range
    CHECK ( temperature_degree BETWEEN 0 AND 100);
	
-- Встановлення обмеження вмісту стовпчика Нове значення температури таблиці Зміна температури
ALTER TABLE TemperatureChange ADD CONSTRAINT new_temperature_range
    CHECK ( new_temperature_degree BETWEEN 0 AND 100);