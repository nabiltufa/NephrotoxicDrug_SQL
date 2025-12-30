  /* GLOSARIUM
  Dataset ini menyediakan kumpulan data yang komprehensif mengenai informasi klinis pasien, profil paparan obat, serta karakteristik biokimia obat untuk mendukung penelitian dalam identifikasi dini Penyakit Ginjal Kronis (Chronic Kidney Disease/CKD). Dataset ini menggabungkan indikator kesehatan pasien bergaya dunia nyata dengan properti rinci obat nefrotoksik dan non-nefrotoksik yang berpotensi memengaruhi fungsi ginjal.

Dataset ini mencakup:
✔ Informasi Klinis Pasien
Meliputi usia, jenis kelamin, tekanan darah, kadar urea darah, kreatinin serum, kadar albumin, glukosa darah acak, serta kondisi kesehatan seperti diabetes dan hipertensi. Variabel-variabel ini merepresentasikan faktor klinis umum yang berkaitan dengan kesehatan ginjal.
✔ Profil Paparan Obat
Setiap pasien dikaitkan dengan satu jenis obat beserta dosis dan durasi penggunaannya. Terdapat label terpisah yang menunjukkan apakah obat tersebut tergolong nefrotoksik.
✔ Fitur Molekuler dan Struktur Obat
Dataset ini mencakup karakteristik kimia seperti berat molekul, lipofilisitas, sifat ikatan hidrogen, luas permukaan polar, serta deskriptor struktur 3D. Fitur-fitur ini membantu merepresentasikan bagaimana senyawa yang berbeda dapat berinteraksi secara biologis.
✔ Indikator Farmakokinetik dan Toksisitas
Properti seperti laju klirens, waktu paruh, bioavailabilitas, ikatan protein, serta indikator viabilitas sel, stres mitokondria, dan aktivitas oksidatif disertakan untuk memberikan gambaran perilaku obat dan potensi dampaknya terhadap ginjal.
✔ Klasifikasi Risiko CKD
Setiap data memiliki label tingkat risiko CKD yang diturunkan dari biomarker klinis, kondisi kesehatan, dan indikator toksisitas obat. Tingkat risiko dikategorikan sebagai:

0 – Risiko rendah

1 – Risiko sedang

2 – Risiko tinggi

🎯 Tujuan Dataset

Dataset ini dirancang untuk mendukung penelitian yang meliputi:

Deteksi dini dan pemantauan CKD

Evaluasi stres ginjal yang berkaitan dengan penggunaan obat

Pemahaman pengaruh gabungan faktor klinis dan karakteristik obat terhadap kesehatan ginjal

Pengembangan aplikasi layanan kesehatan berbasis data serta sistem pendukung keputusan
 
CKD adalah singkatan dari Chronic Kidney Disease atau Penyakit Ginjal Kronis, yaitu kondisi penurunan fungsi ginjal secara bertahap selama lebih dari 3 bulan, yang bisa disebabkan oleh diabetes, tekanan darah tinggi, atau gaya hidup tidak sehat, dan umumnya tidak dapat pulih total, namun dapat dikelola untuk mencegah perburukan.  

APA ITU CKD?
Fungsi Ginjal Menurun: Ginjal tidak lagi efektif menyaring limbah, cairan berlebih, dan zat sisa metabolisme dari darah. 
Kerusakan Bertahap: Terjadi kelainan jaringan, komposisi darah, atau urine selama minimal 3 bulan. 
Progresif: Penyakit ini umumnya tidak bisa kembali normal dan meningkatkan risiko penyakit lain seperti jantung dan stroke. 

PENYEBAB UMUM
1. Diabetes Mellitus (kencing manis).
2. Hipertensi (tekanan darah tinggi).
3. Gaya hidup tidak sehat (obesitas, merokok, alkohol). 
4. Gejala (Biasanya terasa saat sudah stadium lanjut)
5. Bengkak di kaki atau pergelangan kaki.
6. Tekanan darah tinggi yang sulit dikontrol.
7. Sering merasa lelah, pucat, atau kram otot.
8. Perubahan pola buang air kecil (lebih sering, atau lebih sedikit). 

PENANGANAN
1. Mengelola penyakit penyebab (diabetes, hipertensi).
2. Obat-obatan untuk kontrol gejala.
3. Cuci darah (dialisis) atau transplantasi ginjal pada stadium akhir.
4. Pola hidup sehat untuk pencegahan dan manajemen. 

  */
  
  SELECT TOP (1000) [patient_age]
      ,[gender]
      ,[bp_systolic]
      ,[bp_diastolic]
      ,[blood_urea]
      ,[serum_creatinine]
      ,[albumin]
      ,[blood_glucose_random]
      ,[diabetes]
      ,[hypertension]
      ,[drug_name]
      ,[drug_dosage_mg]
      ,[exposure_days]
      ,[nephrotoxic_label]
      ,[mol_weight]
      ,[logP]
      ,[hbond_donors]
      ,[hbond_acceptors]
      ,[rotatable_bonds]
      ,[tpsa]
      ,[shape_index_3d]
      ,[inertia_x]
      ,[inertia_y]
      ,[inertia_z]
      ,[charge_distribution]
      ,[clearance_rate]
      ,[half_life_hr]
      ,[bioavailability_pct]
      ,[volume_of_distribution]
      ,[kidney_cell_viability_pct]
      ,[mitochondrial_damage]
      ,[oxidative_stress]
      ,[protein_binding_pct]
      ,[serum_creatinine_change_pct]
      ,[toxicity_score_composite]
      ,[pk_toxic_interaction_score]
      ,[ckd_risk_label]
  FROM [Drug].[dbo].[NephrotoxicDrug];
  
  -- rubah tipe data usia pasien menjadi integer
  ALTER Table NephrotoxicDrug
  ALTER COLUMN patient_age INT;

  -- mengetahui jumlah baris data
  select count (*) from Drug.dbo.NephrotoxicDrug; -- 1.500 kolom

  ================================================================================================================================================================
  -- mengetahui rentang umur pasien
  select min(patient_age) as usia_termuda, max(patient_age) as usia_tertua from Drug.dbo.NephrotoxicDrug; 
  -- usia termuda 18 tahun dan usia tertua 89 tahun

  -- select count(*) from Drug.dbo.NephrotoxicDrug where patient_age >= 60 --512 org lansia

  -- mengetahui kelas umur pasien (menggunakan CTE)
  with rentang_usia AS (
	select
		-- patient_age,
		-- gender,
		CASE
			WHEN patient_age BETWEEN 11 AND 25 THEN 'Remaja'
			WHEN patient_age BETWEEN 25 AND 59 THEN 'Dewasa'
			ELSE 'Lansia'
		END as rentang_usia_pasien
		-- COUNT (*) AS total_pasien
	FROM
		Drug.dbo.NephrotoxicDrug
  )
  SELECT 
	-- patient_age,
	-- gender,
	rentang_usia_pasien,
	COUNT (*) AS total_pasien
  FROM
	rentang_usia
  GROUP BY rentang_usia_pasien
-- ORDER BY 
--	patient_age DESC
  
  /* Pasien yang terdata berusia 18 tahun - 89 tahun. Pembagian rentang usia pasien sebagai berikut:
	1. Lansia : 604 Pasien
	2. Remaja : 181 Pasien
	3. Dewasa: 715 Pasien
  */

 -- memastikan konsistensi data gender
 select distinct gender from Drug.dbo.NephrotoxicDrug

 -- apakah ada data null?
 select count (*) gender from NephrotoxicDrug
 -- tidak ada data null

 -- Insert into ke tabel gender
 SELECT patient_age, gender INTO Usia_Pasien from Drug.dbo.NephrotoxicDrug

 select * from Drug.dbo.NephrotoxicDrug

 -- mengetahui database yang aktif
 select DB_NAME() as CURRENTDATABASE
 select * from Usia_Pasien

 -- mencari informasi tabel yang tercreate
 EXEC sp_help 'Usia_Pasien'
 SELECT s.name AS schema_name, t.name AS table_name
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE t.name = 'Usia_Pasien';

-- memindahkan tabel dari database 1 ke database lain
SELECT * INTO Drug.dbo.Usia_Pasien FROM master.dbo.Usia_Pasien 

SELECT * FROM Drug.dbo.Usia_Pasien;
 
==========================================================================================================================================

-- menghitung jenis kelamin
WITH A AS (
	SELECT 
		gender
	from Drug.dbo.NephrotoxicDrug
)
SELECT
	gender,
COUNT (*) as jenis_kelamin
FROM
	A
GROUP BY
	gender

/* Gender terdiri dari 2 jenis
	1. Male = 724 orang
	2. Female = 776 orang */

============================================================================================================================================================
-- menghitung jumlah obat
SELECT COUNT (*) drug_name FROM Drug.dbo.NephrotoxicDrug;
-- 1500 data, tidak ada nilai null

============================================================================================================================================================
-- melihat drug_name
SELECT DISTINCT drug_name from Drug.dbo.NephrotoxicDrug
/* Ada 8 jenis obat yang tersedia, yaitu:
	1. Cisplatin --> Obat kemoterapi (agen antikanker), Cisplatin adalah salah satu penyebab utama cedera ginjal akut (AKI) akibat obat karena akumulasi di tubulus ginjal.
	2. Gentamicin --> Antibiotik aminoglikosida, Dapat menyebabkan nekrosis tubulus akut, terutama jika digunakan lama atau dosis tinggi.
	3. Vancomycin --> Antibiotik glikopeptida, Risiko meningkat jika dikombinasikan dengan obat nefrotoksik lain.
	4. Paracetamol --> Pereda nyeri dan penurun demam, Lebih berisiko ke hati, bukan ginjal (kecuali overdosis berat).
	5. Ibuprofen --> Nyeri, peradangan, demam, Dapat menurunkan aliran darah ginjal → berbahaya pada pasien CKD.
	6. Aspirin --> Nyeri, demam, pencegahan penyakit jantung, Dosis rendah relatif aman, dosis tinggi berisiko ke ginjal.
	7. Amphotericin-B --> Infeksi jamur sistemik berat, Salah satu obat dengan tingkat nefrotoksisitas tertinggi dalam praktik klinis.
	8. Tobramycin --> Infeksi Gram-negatif berat, Mekanisme toksisitas mirip gentamicin.
	
	Notes: 7 Jenis obat beresiko ke ginjal. 1 obat yaitu paracetamol tidak beresiko ke ginjal
*/

ALTER TABLE Drug.dbo.NephrotoxicDrug
ALTER COLUMN nephrotoxic_label INT;

SELECT TOP 10 drug_name, nephrotoxic_label from Drug.dbo.NephrotoxicDrug WHERE drug_name = 'Paracetamol'

SELECT COUNT (*) FROM Drug.dbo.NephrotoxicDrug WHERE nephrotoxic_label = 0 -- 578 obat non Nephrotoxic
SELECT COUNT (*) FROM Drug.dbo.NephrotoxicDrug WHERE nephrotoxic_label = 1 -- 922 obat Nephrotoxic

WITH obat_nephrotoxic AS (
	SELECT
			drug_name,
			nephrotoxic_label,
		CASE
			WHEN nephrotoxic_label = 0 THEN 'non nephrotoxic'
			WHEN nephrotoxic_label = 1 THEN 'nephrotoxic'
		END as kategori_obat
	FROM Drug.dbo.NephrotoxicDrug
)

SELECT
	drug_name,
	kategori_obat,
	COUNT (*) AS jumlah_kategori_obat
INTO Drug.dbo.Kategori_Obat -- Membuat tabel dan memindahkan isinya ke dalam tabel baru
FROM
	obat_nephrotoxic
GROUP BY drug_name, kategori_obat
ORDER BY jumlah_kategori_obat 


-- melihat jumlah kategori obat
SELECT * from Drug.dbo.Kategori_Obat
=========================================================================================================================================

-- cek tekanan darah sistolic dan diastolic
 /* 
 1. Tekanan sistolik: Tekanan di arteri saat jantung memompa darah (kontraksi).
	Normal: < 120 mmHg.
	Hipertensi: ≥ 140 mmHg.
	Hipotensi (Rendah): < 90 mmHg. 

2. Tekanan diastolik: tekanan saat jantung beristirahat di antara detak jantung.

Kelompok tekanan darah: 
Normal: Kurang dari 120/80 mmHg
Elevated (Meningkat): Sistolik antara 120-129 mmHg dan diastolik kurang dari 80 mmHg
Hipertensi Stage 1: Sistolik antara 130-139 mmHg atau diastolik antara 80-89 mmHg
Hipertensi Stage 2: Sistolik 140 mmHg atau lebih tinggi atau diastolik 90 mmHg atau lebih tinggi
Krisis Hipertensi: Sistolik lebih tinggi dari 180 mmHg dan/atau diastolik lebih tinggi dari 120 mmHg (memerlukan penanganan medis segera)
*/

-- Mengelompokkan rentang usia dengan tekanan sistolik dan diastolik nya
-- sebelum itu, rubah tipe data bp_systolic dan bp_diastolic menjadi float
alter table Drug.dbo.NephrotoxicDrug
alter column bp_systolic FLOAT;

ALTER table Drug.dbo.NephrotoxicDrug
ALTER COLUMN bp_diastolic FLOAT;

SELECT * FROM Drug.dbo.NephrotoxicDrug;

===========================================================================================================================================
  -- mengetahui kelas umur pasien (menggunakan CTE)
  with tensi AS (
	select
		 patient_age,
		 gender,
		 bp_systolic,
		 bp_diastolic,
		CASE
			WHEN bp_systolic < 90 and bp_diastolic < 60 THEN 'Hipotensi'
			WHEN bp_systolic >=140 OR bp_diastolic >= 90 THEN 'Hipertensi Stage 2'
			WHEN bp_systolic BETWEEN 130 AND 139 OR bp_diastolic BETWEEN 80 AND 89 THEN 'Hipertensi Stage 1'
			WHEN bp_systolic BETWEEN 120 AND 129 AND bp_diastolic < 80.0 THEN 'Meningkat'
			WHEN bp_systolic < 120 AND bp_diastolic < 80 THEN 'Normal'
			ELSE 'Data tidak valid'
			-- ELSE 'Hipotensi'
		END as tekanan_darah
	FROM
		Drug.dbo.NephrotoxicDrug nd
  )
  SELECT 
	--patient_age,
	--gender,
	--bp_systolic,
	--bp_diastolic,
	tekanan_darah,
	COUNT (*) AS Total_Pasien
	-- INTO Drug.dbo.Kelompok_Tekanan_Darah -- memindahkan ke tabel baru
  FROM
	tensi
  GROUP BY 
	tekanan_darah
  ORDER BY
	Total_Pasien


 SELECT * FROM Kelompok_Tekanan_Darah;

 ===========================================================================================================================
 -- IDENTIFIKASI BERDASARKAN BLOOD UREA

 SELECT * FROM Drug.dbo.NephrotoxicDrug;

 ALTER TABLE Drug.dbo.NephrotoxicDrug
 ALTER COLUMN blood_urea FLOAT;

 WITH urea_darah AS (
 SELECT
	patient_age,
	gender,
	blood_urea,
	CASE
		WHEN blood_urea >50 THEN 'Uremia'
		WHEN blood_urea BETWEEN 22 AND 50 THEN 'Tinggi'
		WHEN blood_urea BETWEEN 8 AND 24 AND gender = 'Male' THEN 'Normal'
		WHEN blood_urea BETWEEN 6 AND 21 AND gender = 'Female' THEN 'Normal'
		WHEN blood_urea <= 6 THEN 'Rendah'
		ELSE 'Data Tidak Valid'
	 END as Blood_Urea_Nitrogen
FROM Drug.dbo.NephrotoxicDrug
)

SELECT 
	--patient_age,
	--gender,
	--blood_urea,
	COUNT (*) as Total_Pasien,
	Blood_Urea_Nitrogen
-- INTO Drug.dbo.Kadar_Nitrogen_Urea_Darah -- pindah ke tabel baru
FROM urea_darah
GROUP BY Blood_Urea_Nitrogen
ORDER BY Total_Pasien asc

SELECT * FROM Kadar_Nitrogen_Urea_Darah

===============================================================================================================================================
-- ANALISIS SERUM KREATIN
SELECT * FROM NephrotoxicDrug

ALTER TABLE Drug.dbo.NephrotoxicDrug
ALTER COLUMN serum_creatinine FLOAT; 

SELECT min(serum_creatinine) as kadar_minimal_serum_kreatine, max(serum_creatinine) as kadar_maksimal_serum_kreatine from Drug.dbo.NephrotoxicDrug

WITH serum_kreatin AS (
SELECT 
    patient_age,
    gender,
    serum_creatinine,
    CASE
        WHEN serum_creatinine < 0 THEN 'Data Tidak Valid'
        WHEN gender = 'Female' AND serum_creatinine > 1.2 THEN 'Tinggi'
        WHEN gender = 'Male'   AND serum_creatinine > 1.4 THEN 'Tinggi'
        WHEN gender = 'Male' AND serum_creatinine >= 0.7  AND serum_creatinine <= 1.4 THEN 'Normal'
        WHEN gender = 'Female' AND serum_creatinine >= 0.6 AND serum_creatinine <= 1.2 THEN 'Normal'
        WHEN serum_creatinine >= 0 AND serum_creatinine < 0.7 THEN 'Rendah'
       -- ELSE 'Data Tidak Valid'
    END AS kadar_serum_kreatinin
FROM Drug.dbo.NephrotoxicDrug
)

SELECT 
	--patient_age,
	--gender,
	--serum_creatinine,
	COUNT (*) as Total_Pasien,
	kadar_serum_kreatinin
-- INTO Drug.dbo.Kadar_Serum_Keratin
FROM
	serum_kreatin
GROUP BY kadar_serum_kreatinin
ORDER BY Total_Pasien ASC

SELECT * FROM Kadar_Serum_Keratin;

SELECT COUNT (*) from Drug.dbo.Kadar_Serum_Keratin where patient_age = 69
============================================================================================================================================
-- ANALISIS ALBUMIN

ALTER TABLE Drug.dbo.NephrotoxicDrug
ALTER COLUMN ALBUMIN INT;

SELECT min(albumin) as kadar_albumin_rendah, max(albumin) as kadar_albumin_tinggi from Drug.dbo.NephrotoxicDrug

CARA 1:
SELECT count (*) from Drug.dbo.NephrotoxicDrug where albumin = 0 -- 734 kolom
SELECT count (*) from Drug.dbo.NephrotoxicDrug where albumin = 1 -- 466 kolom
SELECT count (*) from Drug.dbo.NephrotoxicDrug where albumin = 2 -- 234 kolom
SELECT count (*) from Drug.dbo.NephrotoxicDrug where albumin = 3 -- 66 kolom

CARA 2:
SELECT 
    albumin,
    COUNT(*) AS total
FROM Drug.dbo.NephrotoxicDrug
GROUP BY albumin
ORDER BY albumin;

================================================================================================================

-- kadar glukosa
ALTER TABLE Drug.dbo.NephrotoxicDrug
ALTER COLUMN blood_glucose_random FLOAT;

Lansia	604
Remaja	181
Dewasa	715

SELECT * FROM NephrotoxicDrug

WITH kadar_glukosa AS (
SELECT
	patient_age,
	gender,
	blood_glucose_random,
	CASE
		WHEN patient_age >= 60 AND blood_glucose_random > 180 THEN 'Suspect Diabetes'
		WHEN patient_age >= 60 AND blood_glucose_random <=180 THEN 'Normal'
		WHEN patient_age < 60 AND blood_glucose_random <= 140 THEN 'Normal'
		WHEN patient_age < 60 AND blood_glucose_random >140 THEN 'Suspect Diabetes'
		ELSE 'Data Tidak Valid'
	END AS kategori 
FROM Drug.dbo.NephrotoxicDrug
)
-- pindahkan ke tabel baru
--SELECT 
--	patient_age,
--	gender,
--	blood_glucose_random,
--	kategori
--INTO Drug.dbo.Kadar_Glukosa_Pasien
--FROM kadar_glukosa

SELECT 
	-- patient_age,
	-- gender,
	-- blood_glucose_random,
	kategori,
	COUNT (*) as Total_Pasien
FROM kadar_glukosa
GROUP BY kategori
ORDER BY kategori

==================================================================================================================================
-- analisis CKD RISK LABEL

SELECT * FROM Drug.dbo.NephrotoxicDrug

-- SELECT drug_name from NephrotoxicDrug where Substring(drug_name,5,1) like '%p%'
SELECT DISTINCT ckd_risk_label FROM Drug.dbo.NephrotoxicDrug

WITH A AS (
	SELECT
		patient_age,
		gender,
		drug_name,
		ckd_risk_label,
			CASE
				WHEN ckd_risk_label = 0 THEN 'Tidak beresiko'
				WHEN ckd_risk_label = 1 THEN 'Beresiko Rendah'
				WHEN ckd_risk_label = 2 THEN 'Beresiko Tinggi'
			END as label_ckd
		FROM Drug.dbo.NephrotoxicDrug
)

--SELECT 
--	patient_age,
--	gender,
--	drug_name,
--	ckd_risk_label,
--	label_ckd
--INTO Drug.dbo.CKD
--FROM A

SELECT 
	--patient_age,
	--gender,
	--drug_name,
	--ckd_risk_label,
	--label_ckd
	-- patient_age,
	COUNT (*) as Total_Pasien,
	-- gender,
	label_ckd

FROM A
	GROUP BY label_ckd
	--, gender, patient_age
ORDER BY
Total_Pasien ASC
	
====================================================================================================================================
 