-- CREATE SCHEMA student_and_lecturer_mis;

-- CREATE TABLE student_and_lecturer_mis.student_info_tb(
-- 	student_id BIGSERIAL PRIMARY KEY,
-- 	st_fName text,
-- 	st_Lname text,
-- 	st_other_names text,
-- 	email varchar,
-- 	phone text,
-- 	address text,
-- 	d_o_b date
-- )

-- CREATE TABLE student_and_lecturer_mis.student_finance_tb(
-- 	id BIGSERIAL PRIMARY KEY,
-- 	student_id BIGSERIAL,
-- 	allocated_fees INTEGER,
-- 	debit_amount INTEGER,
-- 	balance INTEGER GENERATED ALWAYS AS (debit_amount - allocated_fees) STORED,
	
-- 	FOREIGN KEY(student_id) REFERENCES student_and_lecturer_mis.student_info_tb(student_id)
-- );


-- CREATE TABLE student_and_lecturer_mis.courses_tb(
-- 	course_code VARCHAR PRIMARY KEY,
-- 	course_title TEXT,
-- 	credits INTEGER
-- )

-- CREATE TABLE student_and_lecturer_mis.st_reg_course(
-- 	registration_id BIGSERIAL PRIMARY KEY,
-- 	student_id BIGSERIAL,
-- 	course_code VARCHAR,
	
-- 	FOREIGN KEY(student_id) REFERENCES student_and_lecturer_mis.student_info_tb(student_id)
-- )

-- CREATE TABLE student_and_lecturer_mis.lecturer_course_tb(
-- 	lecturer_id BIGSERIAL PRIMARY KEY,
-- 	lecturer_name TEXT,
-- 	email VARCHAR,
-- 	course_code VARCHAR,
-- 	TA_name TEXT,
	
-- 	FOREIGN KEY(course_code) REFERENCES student_and_lecturer_mis.courses_tb(course_code)
-- )


-- CREATE OR REPLACE FUNCTION student_and_lecturer_mis.select_st_reg_course(
-- 	)
--     RETURNS text
--     LANGUAGE 'plpgsql'
--     COST 100
--     VOLATILE PARALLEL UNSAFE
-- AS $BODY$
-- DECLARE 
--     json_result_obj TEXT DEFAULT '';
-- BEGIN
--       json_result_obj= json_build_object('success',true,'data',array_to_json(array_agg(row_to_json(t))))
--  from (SELECT * FROM student_and_lecturer_mis.student_info_tb RIGHT JOIN student_and_lecturer_mis.st_reg_course ON student_and_lecturer_mis.student_info_tb.student_id = student_and_lecturer_mis.st_reg_course.student_id FULL OUTER JOIN student_and_lecturer_mis.courses_tb ON student_and_lecturer_mis.st_reg_course.course_code = student_and_lecturer_mis.courses_tb.course_code WHERE student_and_lecturer_mis.student_info_tb.email = ':email') t;
-- IF  json_result_obj IS NULL THEN
--      json_result_obj = json_build_object('success',false,'msg','Error Loading Data');
-- END IF;
--   RETURN json_result_obj;
-- END;
-- $BODY$



-- CREATE TABLE student_and_lecturer_mis.lecturer_course_tb(
-- 	lecturer_id BIGSERIAL PRIMARY KEY,
-- 	lecturer_name TEXT,
-- 	email VARCHAR,
-- 	course_code VARCHAR,
-- 	TA_name TEXT,
	
-- 	FOREIGN KEY(course_code) REFERENCES student_and_lecturer_mis.courses_tb(course_code)
-- )


-- CREATE OR REPLACE FUNCTION student_and_lecturer_mis.select_st_fin_info(
-- 	)
--     RETURNS text
--     LANGUAGE 'plpgsql'
--     COST 100
--     VOLATILE PARALLEL UNSAFE
-- AS $BODY$
-- DECLARE 
--     json_result_obj TEXT DEFAULT '';
-- BEGIN
--       json_result_obj= json_build_object('success',true,'data',array_to_json(array_agg(row_to_json(t))))
--  from (SELECT * FROM student_and_lecturer_mis.student_info_tb FULL OUTER JOIN student_and_lecturer_mis.student_finance_tb ON student_and_lecturer_mis.student_info_tb.student_id = student_and_lecturer_mis.student_finance_tb.student_id) t;
-- IF  json_result_obj IS NULL THEN
--      json_result_obj = json_build_object('success',false,'msg','Error Loading Data');
-- END IF;
--   RETURN json_result_obj;
-- END;
-- $BODY$;

-- CREATE OR REPLACE FUNCTION student_and_lecturer_mis.select_st_info(
-- 	)
--     RETURNS text
--     LANGUAGE 'plpgsql'
--     COST 100
--     VOLATILE PARALLEL UNSAFE
-- AS $BODY$
-- DECLARE 
--     json_result_obj TEXT DEFAULT '';
-- BEGIN
--       json_result_obj= json_build_object('success',true,'data',array_to_json(array_agg(row_to_json(t))))
--  from (SELECT * FROM student_and_lecturer_mis.student_info_tb FULL OUTER JOIN student_and_lecturer_mis.st_reg_course ON student_and_lecturer_mis.student_info_tb.student_id = student_and_lecturer_mis.st_reg_course.student_id) t;
-- IF  json_result_obj IS NULL THEN
--      json_result_obj = json_build_object('success',false,'msg','Error Loading Data');
-- END IF;
--   RETURN json_result_obj;
-- END;
-- $BODY$;

-- CREATE OR REPLACE FUNCTION student_and_lecturer_mis.select_all_courses(
-- 	)
--     RETURNS text
--     LANGUAGE 'plpgsql'
--     COST 100
--     VOLATILE PARALLEL UNSAFE
-- AS $BODY$
-- DECLARE 
--     json_result_obj TEXT DEFAULT '';
-- BEGIN
--       json_result_obj= json_build_object('success',true,'data',array_to_json(array_agg(row_to_json(t))))
--  from (SELECT * FROM student_and_lecturer_mis.courses_tb) t;
-- IF  json_result_obj IS NULL THEN
--      json_result_obj = json_build_object('success',false,'msg','Error Loading Data');
-- END IF;
--   RETURN json_result_obj;
-- END;
-- $BODY$;


-- INSERT INTO student_and_lecturer_mis.student_info_tb (student_id,first_name, last_name, email, phone_number, address, date_of_birth)
-- VALUES
-- (11004272,'Ishaan', 'Bhardwaj', 'ishbhardwaj@st.ug.edu.gh', '0553072737', '123 Main St', '2000-01-01'),
-- (11010910,'Samia', 'Soleimani', 'samiasolei@st.ug.edu.gh', '0551068786', '719 Elm St', '2003-05-02'),
-- (11275876,'Prince', 'Nyayun', 'pnyayun@st.ug.edu.gh', '0257629963', '215 Quarshie St', '1999-02-08'),
-- (10979385,'Luqman', 'Abdulmumin', 'labdulmumin@st.ug.edu.gh', '02777450374', '238 Alafia St', '2000-05-06'),
-- (11012330,'Arthur', 'Ebenezer', 'artheben@st.ug.edu.gh', '0246833694', '543 Ogbona St', '2000-08-02'),
-- (11049492,'Asare', 'Marvin', 'asaremav@st.ug.edu.gh', '0556833694', '321 Baboon St', '2001-04-05'),
-- (11018690,'Oblie', 'Pius', 'obliepius@st.ug.edu.gh', '0541759050', '654 Osa St', '2002-07-02'),
-- (11021544,'Iddrisu', 'Tahiru', 'iddrisutahiru@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11012343,'Kumi', 'Kelvin', 'kumikelvin@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11014727,'Annan Chioma', 'Praise', 'annanchioma@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11014977,'Mohammed Salihu', 'Hamisu', 'mohasalihu@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11015506,'Daniel Agyin', 'Manford', 'daagyin@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11023595,'Nyavor Cyril', 'Etornam', 'nyacyrili@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11025159,'David Kweku', 'Ntow', 'dakweku@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11038081,'Agyepong', 'Kwasi', 'agyekwasi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11049523,'Peggy Esinam', 'Somuah', 'peesinam@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11053386,'Amonsah', 'Samuel', 'amonsam@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11105235,'Andrews Kwarteng', 'Twum', 'andkwat@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11112276,'Fiavor Isaac', 'Sedem', 'fiaisaac@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11116537,'Yakubu Tanko', 'Mohammed', 'yakutanko@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11116737,'Eririe', 'Jefferey', 'eririejefi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11116804,'Kafui Kwame', 'Kemeh', 'kafuikemeh@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11117318,'Nyarko Steven', 'Abrokwah', 'nyarkosteven@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11117536,'Muhammed Nurul Haqq', 'Munagah', 'muhanuru@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11123762,'Bernadine Adusei', 'Okrah', 'bernaddineokrah@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11139245,'Maame Efua', 'Ayisi', 'maameefua@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11139828,'Ansiogya Philemon', 'Kwabena', 'ansiphilemon@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11164744,'Antwi Samuel', 'Anafi', 'kkofi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11170350,'Nkansah Boadu', 'Tabi', 'nkansahtabi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11172376,'Wenide Isaac', 'Atta', 'weniataa@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11208328,'John Tenkorang', 'Anim', 'johnanim@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11209640,'Abubakar', 'Latifa', 'abulatifah@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11213307,'Attu Samuel', 'Idana', 'attusamuel@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11218951,'Adorboe Prince', 'Philips', 'adorboeprince@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11238291,'Ninson', 'Obed', 'ninsonobed@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11246366,'Anewah', 'Vincent', 'anewahvincent@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11252855,'Quansah', 'Jeffery', 'quansahjeff@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11252857,'Nuku Tagbor', 'Joshua', 'nukujosh@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11253931,'Desmond Afelete', 'Kamasah', 'desafelete@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11254079,'Fordjour Edward', 'John', 'fordjouredward@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11254301,'Kudiabor', 'Jonathan', 'kujonathan@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11254405,'Abena Nhyira', 'Nsaako', 'abenansaako@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11262592,'Dedoo Donatus', 'Dodzi', 'dedoododzi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11264010,'Ayertey Vanessa', 'Esinam', 'ayerteyvanessa@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11285635,'David Tetteh', 'Ankrah', 'davidtetteh@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11292620,'Sena', 'Anyomi', 'senaanyomi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11293871,'Amponsah Jonathan', 'Boadu', 'joboadu@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11296641,'Asare Baffour', 'David', 'bdavid@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11296662,'Amevenku K.', 'Mawuli', 'amemawuli@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11297849,'Isaac Nii', 'Nortey', 'isaacnii@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11305528,'Nana Fosu', 'Asamoah', 'nanafosu@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11330446,'Yasmeen Xoladem', 'Doku', 'yasxoladem@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11332163,'Matthew Kotey', 'Amponsah', 'matkotey@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11333321,'Fall', 'Galas', 'fallgalas@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-11'),
-- (11334401,'Awal', 'Mohammed', 'awalmohammed@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-09-19'),
-- (11338323,'Ahmed Fareed', 'Opare', 'fareedoparei@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2005-05-18'),
-- (11347946,'Derick', 'Amponsah', 'derrickamponsah@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2004-06-17'),
-- (11348310,'Freda Elikplim', 'Apetsi', 'fredaapetsi@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2003-03-16'),
-- (11353826,'Dabanka Hayet', 'Gyasiwa', 'hayetgyasiwa@st.ug.edu.gh', '0265996933', '224 Wasabanga St', '2002-01-15'),
-- (11356825,'Edward Opoku', 'Agyemang', 'edwardagyemang@st.ug.edu.gh', '0265996788', '224 Pwalugu St', '2003-05-12'),
-- (11358243,'Nana Kwasi', 'Kwakye', 'nanakkwakye@st.ug.edu.gh', '0265996933', '224 Nkyi St', '2003-09-30'),
-- (10975105,'Daniel Akwertey', 'Tetteh', 'danitetteh@st.ug.edu.gh', '0265996933', '224 Nkyi St', '2003-09-30');


