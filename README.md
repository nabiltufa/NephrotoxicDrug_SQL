# CKD_NephrotoxicDrug_Dataset

Dataset diperoleh dari [Kaggle](https://www.kaggle.com/code/devraai/ckd-risk-prediction-from-nephrotoxic-drug-data/input) berjudul CKD Risk Prediction from Nephrotoxic Drug Data
<br><br>
Tentang Dataset: <br><br>
Dataset ini mengandung informasi klinis pasien, obat & dosis yang digunakan, dan kandungan biokimia yang digunakan dalam analisis kesehatan. Setiap baris merepresentasikan kondisi kesehatan masing-masing pasien beserta obat yang diresepkan, deskripsi kandungan obat, perawatan medis yang dibtuhkan, serta indikator yang berkaitan dengan toksisitas dan fungsi ginjal.
Dataset menyediakan semua variabel yang berhubungan untuk menganalisis faktor klinis dan karakteristik obat mungkin dapat berkontribusi dalam setiap lebel Resiko Penyakit Ginjak Kronis (CKD).
Dataset telah dirancang dalam bentuk tabular, bersih, dan dapat langsung digunakan untuk analisis, visualisasi atau model prediksi.

<br>
Dataset ini mencakup: <br>
✔ Informasi Klinis Pasien<br>
Meliputi usia, jenis kelamin, tekanan darah, kadar urea darah, kreatinin serum, kadar albumin, glukosa darah acak, serta kondisi kesehatan seperti diabetes dan hipertensi. Variabel-variabel ini merepresentasikan faktor klinis umum yang berkaitan dengan kesehatan ginjal. <br>
✔ Profil Paparan Obat<br>
Setiap pasien dikaitkan dengan satu jenis obat beserta dosis dan durasi penggunaannya. Terdapat label terpisah yang menunjukkan apakah obat tersebut tergolong nefrotoksik.<br>
✔ Fitur Molekuler dan Struktur Obat<br>
Dataset ini mencakup karakteristik kimia seperti berat molekul, lipofilisitas, sifat ikatan hidrogen, luas permukaan polar, serta deskriptor struktur 3D. Fitur-fitur ini membantu merepresentasikan bagaimana senyawa yang berbeda dapat berinteraksi secara biologis.<br>
✔ Indikator Farmakokinetik dan Toksisitas<br>
Properti seperti laju klirens, waktu paruh, bioavailabilitas, ikatan protein, serta indikator viabilitas sel, stres mitokondria, dan aktivitas oksidatif disertakan untuk memberikan gambaran perilaku obat dan potensi dampaknya terhadap ginjal.<br>
✔ Klasifikasi Risiko CKD<br>
Setiap data memiliki label tingkat risiko CKD yang diturunkan dari biomarker klinis, kondisi kesehatan, dan indikator toksisitas obat. Tingkat risiko dikategorikan sebagai:<br>
0 – Risiko rendah<br>
1 – Risiko sedang<br>
2 – Risiko tinggi<br>

# Apa itu CKD?
CKD adalah singkatan dari Chronic Kidney Disease atau Penyakit Ginjal Kronis, yaitu kondisi penurunan fungsi ginjal secara bertahap selama lebih dari 3 bulan, yang bisa disebabkan oleh diabetes, tekanan darah tinggi, atau gaya hidup tidak sehat, dan umumnya tidak dapat pulih total, namun dapat dikelola untuk mencegah perburukan. Poin yang dapat di garis bawahi adalah: <br>
1. Fungsi Ginjal Menurun: Ginjal tidak lagi efektif menyaring limbah, cairan berlebih, dan zat sisa metabolisme dari darah. 
2. Kerusakan Bertahap: Terjadi kelainan jaringan, komposisi darah, atau urine selama minimal 3 bulan. 
3. Progresif: Penyakit ini umumnya tidak bisa kembali normal dan meningkatkan risiko penyakit lain seperti jantung dan stroke.

# PENYEBAB UMUM
1. Diabetes Mellitus (kencing manis). <br>
2. Hipertensi (tekanan darah tinggi). <br>
3. Gaya hidup tidak sehat (obesitas, merokok, alkohol). <br> 
4. Gejala (Biasanya terasa saat sudah stadium lanjut). <br>
   a. Bengkak di kaki atau pergelangan kaki. <br>
   b. Tekanan darah tinggi yang sulit dikontrol. <br>
   Sering merasa lelah, pucat, atau kram otot. <br>
   Perubahan pola buang air kecil (lebih sering, atau lebih sedikit). <br>

# PENANGANAN
1. Mengelola penyakit penyebab (diabetes, hipertensi). <br>
2. Obat-obatan untuk kontrol gejala. <br>
3. Cuci darah (dialisis) atau transplantasi ginjal pada stadium akhir. <br>
4. Pola hidup sehat untuk pencegahan dan manajemen. <br>

# EKSPLORASI DATA
1. Memasukkan dataset kedalam database <br>
   Saya memilih menggunakan SQL Server karena proses pengolahan query yang lebih mudah. Dataset yang diperoleh berbentuk file .csv yang akan di impor kedalam database. Pada database yang telah dibuat, cukup klik kanan --> Task --> Import Data. Pilih datasource berasal dari flatfilesource (atau bisa disesuaikan dengan dataset yang dimiliki) lalu masukkan file nya. File akan tergenerate menjadi sebuah tabel dalam database. <br>
   <img width="400" height="300" alt="image" src="https://github.com/user-attachments/assets/5306386d-6e45-4249-a789-a8920d50ee76" />

2. Menampilkan data <br>
```
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
```
Selain itu, penting juga untuk mengetahui jumlah baris data, menggunakan query sebagai berikut:
```
 select count (*) from Drug.dbo.NephrotoxicDrug; -- 1.500 kolom
```
Dataset memiiliki 1.500 kolom. Setiap baris menampilkan 1 kondisi pasien. Artinya, terdapat 1.500 sample pasien dengan berbagai rentang usia, jenis kelamin, kondisi kesehatan, berbagai perawatan, dan resiko CKD. <br>
<img width="1751" height="568" alt="image" src="https://github.com/user-attachments/assets/51305035-b410-412c-9632-19f82f432fe7" />

2. Melihat tipe data <br>
   Tipe data dapat dilihat melalui design table. Semula, tipe data akan menyesuaikan dengan format dataset. Namun dapat diubah tergantung kebutuhan pengolahan data. Tipe data dapat diubah melalui GUI atau Query. Jika ingin merubah tipe data menggunakan query, dapat menggunakan script berikut:<br>
   ```
    ALTER Table NephrotoxicDrug <br>
    ALTER COLUMN patient_age INT;
   ```
   <img width="1751" height="568" alt="image" src="https://github.com/user-attachments/assets/44f377c0-5e58-4a1c-a582-89ce5cdb5dc7" /> <br>
3. Mengetahui rentang usia pasien
   Untuk mengetahui rentang usia pasien menggunakan query berikut: <br>
   ``
    select min(patient_age) as usia_termuda, max(patient_age) as usia_tertua from Drug.dbo.NephrotoxicDrug; -- Mengetahui usia termuda dan tertua pasien
   `` <br>
   <img width="285" height="127" alt="image" src="https://github.com/user-attachments/assets/0353bc80-4bc0-459d-8d79-7309f323db08" /> <br>
   Untuk mengelompokkan pasien berdasarkan kelompok usia menggunakan query berikut:
   ```
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
   ```
   <img width="357" height="145" alt="image" src="https://github.com/user-attachments/assets/0db8f30e-c2a5-470a-9eb8-07d62e5a5260" /> <br>
   Pasien yang terdata berusia 18 tahun - 89 tahun. Pengelompokkan rentang usia pasien sebagai berikut: <br>
	1. Lansia : 604 Pasien <br>
	2. Remaja : 181 Pasien <br>
	3. Dewasa: 715 Pasien <br>

4. Memastikan konsistensi gender & data null
   Dalam dataset, gender tertulis female dan male. Namun, untuk memastikan apakah betul 1.500 baris data konsisten dengan kedua gender tersebut maka bisa dilakukan pengecekan menggunakan query berikut:
   ```
    select distinct gender from Drug.dbo.NephrotoxicDrug
   ```
   Query untuk memastikan tidak ada data null:
   ```
   select count (*) gender from NephrotoxicDrug
   ```
   Query untuk membuat tabel baru berdasarkan usia dan gender:
   ```
    SELECT patient_age, gender INTO Usia_Pasien from Drug.dbo.NephrotoxicDrug
   ```
   Query untuk menghitung pasien berdasarkan jenis kelamin:
   ```
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
   ```
   <img width="280" height="118" alt="image" src="https://github.com/user-attachments/assets/3b2745e4-d090-45b7-b574-649eb26a81e4" /> <br>
   Gender terdiri dari 2 jenis <br>
	1. Male = 724 orang <br>
	2. Female = 776 orang <br>

5. Mengetahui nama obat yang dikonsumsi pasien
   Query untuk memastikan tidak ada data null:
   ```
   SELECT COUNT (*) drug_name FROM Drug.dbo.NephrotoxicDrug; <br>
   -- 1500 data, tidak ada nilai null
   ```
   Query untuk melihat nama obat (tanpa duplikat):
   ```
   SELECT DISTINCT drug_name from Drug.dbo.NephrotoxicDrug
   ```
   <img width="225" height="261" alt="image" src="https://github.com/user-attachments/assets/404e0cfa-e3aa-4244-90f3-b36de9e0a793" /> <br>
   Query untuk mengetahui Nephrotoxic Label:
   ```
   ALTER TABLE Drug.dbo.NephrotoxicDrug
   ALTER COLUMN nephrotoxic_label INT;
   ```
   Query untuk menghitung jumlah obat dan membuat tabel baru berdasarkan nama obat, Nephrotoxic label, dan jumlah pasien yang mengkonsumsi obat tersebut:
   ```
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
   ```
   <img width="547" height="295" alt="image" src="https://github.com/user-attachments/assets/18ebdcff-0c93-468c-8eda-59a57fe32239" /> <br>

   Ada 8 jenis obat yang tersedia, yaitu: <br>
	1. Cisplatin --> Obat kemoterapi (agen antikanker), Cisplatin adalah salah satu penyebab utama cedera ginjal akut (AKI) akibat obat karena akumulasi di tubulus ginjal. <br>
	2. Gentamicin --> Antibiotik aminoglikosida, Dapat menyebabkan nekrosis tubulus akut, terutama jika digunakan lama atau dosis tinggi. <br>
	3. Vancomycin --> Antibiotik glikopeptida, Risiko meningkat jika dikombinasikan dengan obat nefrotoksik lain. <br>
	4. Paracetamol --> Pereda nyeri dan penurun demam, Lebih berisiko ke hati, bukan ginjal (kecuali overdosis berat). <br>
	5. Ibuprofen --> Nyeri, peradangan, demam, Dapat menurunkan aliran darah ginjal → berbahaya pada pasien CKD. <br>
	6. Aspirin --> Nyeri, demam, pencegahan penyakit jantung, Dosis rendah relatif aman, dosis tinggi berisiko ke ginjal. <br>
	7. Amphotericin-B --> Infeksi jamur sistemik berat, Salah satu obat dengan tingkat nefrotoksisitas tertinggi dalam praktik klinis. <br>
	8. Tobramycin --> Infeksi Gram-negatif berat, Mekanisme toksisitas mirip gentamicin. <br>
	Notes: 7 Jenis obat beresiko ke ginjal. 1 obat yaitu paracetamol tidak beresiko ke ginjal <br>

6. Cek tekanan darah
   Query untuk merubah tipe data agar dapat membaca bilangan desimal:
   ```
   ALTER table Drug.dbo.NephrotoxicDrug
   ALTER column bp_systolic FLOAT;

   ALTER table Drug.dbo.NephrotoxicDrug
   ALTER COLUMN bp_diastolic FLOAT;
   ```
   Query untuk mengelompokkan pasien berdasarkan tekanan darah:
   ```
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
		-- COUNT (*) AS total_pasien
	FROM
		Drug.dbo.NephrotoxicDrug nd
     )
     SELECT 
   	patient_age,
   	gender,
   	bp_systolic,
   	bp_diastolic,
   	tekanan_darah
   	INTO Kelompok_Tekanan_Darah -- memindahkan ke tabel baru
     FROM
   	tensi
   ```
   <img width="677" height="528" alt="image" src="https://github.com/user-attachments/assets/7a347708-1e63-4b63-a3ee-7d033ca54e4b" /> <br>
   Query untuk mengelompokkan pasien dan menghitung jumlah pasien per kategori:
   ```
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
   ```
   <img width="358" height="184" alt="image" src="https://github.com/user-attachments/assets/1ecf2a3f-58c4-4b0e-bc97-21aaad19f949" /> <br>

7. Identifikasi berdasarkan kandungan urea darah
   Query merubah tipe data:
   ```
   ALTER TABLE Drug.dbo.NephrotoxicDrug
   ALTER COLUMN blood_urea FLOAT;
   ```
   Query untuk mengelompokkan berdasarkan urea darah dan memasukkan kedalam tabel baru
   ```
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
   	patient_age,
   	gender,
   	blood_urea,
   	Blood_Urea_Nitrogen
   INTO Drug.dbo.Kadar_Nitrogen_Urea_Darah -- pindah ke tabel baru
   FROM urea_darah
   ```
   <img width="1442" height="382" alt="image" src="https://github.com/user-attachments/assets/b0f637eb-4c15-4954-926d-9f96c03a57e7" /> <br>
   Query untuk menhitung jumlah pasien berdasarkan kadar urea darah:
   ```
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
   ```
   <img width="382" height="216" alt="image" src="https://github.com/user-attachments/assets/5919c66c-ab1c-4613-91cc-9ae4e761521a" /> <br>
8. Analisis berdasarkan serum keratin
   Query untuk mengubah tipe data:
   ``
   ALTER TABLE Drug.dbo.NephrotoxicDrug
   ALTER COLUMN serum_creatinine FLOAT; 
   ``
   Query untuk mengetahui kadar minimal dan maksimal serum kreatin:
   ```
   SELECT min(serum_creatinine) as kadar_minimal_serum_kreatine, max(serum_creatinine) as kadar_maksimal_serum_kreatine from Drug.dbo.NephrotoxicDrug
   ```
   Query untuk mengelompokkan pasien berdasarkan kandungan serum kreatin:
   ```
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
   	patient_age,
   	gender,
   	serum_creatinine,
   	kadar_serum_kreatinin
   INTO Drug.dbo.Kadar_Serum_Keratin
   FROM
   	serum_kreatin;
   ```
   <img width="1451" height="401" alt="image" src="https://github.com/user-attachments/assets/69bad3dd-f53d-4816-a97d-8982fc57b1d2" /> <br>
   Query mengelompokkan pasien berdasarkan kadar serum kreatin
   ```
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
   ```
8. Analisis Albumin
   Query untuk merubah tipe data:
   ```
   ALTER TABLE Drug.dbo.NephrotoxicDrug
   ALTER COLUMN ALBUMIN INT
   ```
   Query mengetahui nilai maximal dan minimal albumin:
   ```
   SELECT min(albumin) as kadar_albumin_rendah, max(albumin) as kadar_albumin_tinggi from Drug.dbo.NephrotoxicDrug
   ```
   Query mengelompokkan pasien berdasarkan kadar albumin:
   ```
   SELECT 
    albumin,
    COUNT(*) AS total
   FROM Drug.dbo.NephrotoxicDrug
   GROUP BY albumin
   ORDER BY albumin;
   ```

9. Analisis Kadar Glukosa
   Query untuk merubah tipe data:
   ```
   ALTER TABLE Drug.dbo.NephrotoxicDrug
   ALTER COLUMN blood_glucose_random FLOAT;
   ```
   Query mengelompokkan pasien berdasarkan kadar glukosa:
   ```
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
  
   SELECT 
   	kategori,
   	COUNT (*) as Total_Pasien
   FROM kadar_glukosa
   GROUP BY kategori
   ORDER BY kategori
   ```
   <img width="368" height="146" alt="image" src="https://github.com/user-attachments/assets/7d91fa24-7532-41f9-96b2-05343332522c" /> <br>

   Query emngelompokan pasien berdasarkan kadar glukosa dan memindahkan ke tabel baru:
   ```
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
   SELECT 
   patient_age,
   gender,
   blood_glucose_random,
   kategori
   INTO Drug.dbo.Kadar_Glukosa_Pasien
   FROM kadar_glukosa
   ```
   <img width="1445" height="594" alt="image" src="https://github.com/user-attachments/assets/66856f85-6454-45ac-8d98-0a2612cd7f55" /> <br>

10. Analisis CKD Level
    Query untuk memastikan nilai CKD level
    ```
    SELECT DISTINCT ckd_risk_label FROM Drug.dbo.NephrotoxicDrug
    ```
    <img width="223" height="146" alt="image" src="https://github.com/user-attachments/assets/2c6db303-fa93-4e01-be09-910991cf6299" /> <br>
    Tingkat risiko dikategorikan sebagai: <br>
      0 – Risiko rendah <br>
      1 – Risiko sedang <br>
      2 – Risiko tinggi <br>
    Query mengelompokkan pasien berdasarkan usia, gender, dan label_ckd dan membuat tabel baru berdasarkan resiko CKD
    ```
    
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
      	patient_age,
      	COUNT (*) as Total_Pasien,
      	gender,
      	label_ckd
      
      FROM A
      	GROUP BY label_ckd, gender, patient_age
      ORDER BY
      Total_Pasien ASC
	```
    <img width="1465" height="539" alt="image" src="https://github.com/user-attachments/assets/75021c58-6b06-44da-b8da-eb9e245b0c96" /> <br>
    Pasien dikelompokkan berdasarkan label ckd : <br>
    1. Tidak beresiko : 379 pasien <br>
    2. Beresiko Tinggi : 393 pasien <br>
    3. Beresiko Rendah : 728 pasien <br>






