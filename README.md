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
1. Menampilkan data <br>
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
<img width="1751" height="568" alt="image" src="https://github.com/user-attachments/assets/51305035-b410-412c-9632-19f82f432fe7" />



