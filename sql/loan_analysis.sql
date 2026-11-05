/*
Project   : Credit Risk Dashboard
Tujuan    : Membuat tabel analisis pinjaman (loan_analysis) untuk dashboard Power BI
Sumber    : Banking Transactions Dataset (loans, customers, branches)
Definisi  : Pinjaman bermasalah = status 'Defaulted' atau 'Written Off'
Cakupan   : Pinjaman dengan start_date sebelum 2025-01-01 (2010-2024)
Asumsi    : Batas kelompok credit score, income, dan interest rate ditentukan manual
Catatan   : Ada pembayaran bertanggal sebelum pinjaman dimulai
Validasi  : 21.382 baris, 2.159 pinjaman bermasalah, total 898,2 juta
*/

CREATE TABLE loan_analysis AS
SELECT
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.term_months,
    l.start_date,
    CAST(SUBSTR(l.start_date, 1, 4) AS INTEGER) AS start_year,
    l.status,
    CASE WHEN l.status IN ('Defaulted', 'Written Off') THEN 1 ELSE 0 END AS is_bad,
    c.credit_score,
    CASE WHEN c.credit_score <= 450 THEN '300-450'
         WHEN c.credit_score <= 550 THEN '451-550'
         WHEN c.credit_score <= 650 THEN '551-650'
         WHEN c.credit_score <= 750 THEN '651-750'
         ELSE '751-899' END AS score_band,
    c.annual_income,
    CASE WHEN c.annual_income < 1000000 THEN '< 1 juta'
         WHEN c.annual_income < 2000000 THEN '1-2 juta'
         WHEN c.annual_income < 3000000 THEN '2-3 juta'
         ELSE '>= 3 juta' END AS income_band,
    c.occupation,
    c.gender,
    CASE WHEN l.interest_rate < 8.5  THEN '< 8,5%'
         WHEN l.interest_rate < 10.5 THEN '8,5-10,5%'
         WHEN l.interest_rate < 12.5 THEN '10,5-12,5%'
         WHEN l.interest_rate < 14.5 THEN '12,5-14,5%'
         ELSE '>= 14,5%' END AS rate_band,
    b.branch_name,
    b.city  AS branch_city,
    b.state AS branch_state
FROM loans AS l
JOIN customers AS c ON c.customer_id = l.customer_id
JOIN branches  AS b ON b.branch_id   = l.branch_id;
