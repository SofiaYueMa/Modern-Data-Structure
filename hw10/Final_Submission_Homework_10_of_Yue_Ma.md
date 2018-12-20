---
title: "Final Submission Homework 10 of Yue Ma"
author: "Yue Ma"
date: "12/01/2018"
always_allow_html: yes
output: 
   html_document:
     keep_md: true
---




# 1. Getting to know the data



a) Show a list of the tables.

```sql
-- Check which tables are in the database
SHOW TABLES
```


<div class="knitsql-table">


Table: Displaying records 1 - 10

|Tables_in_witchcraft |
|:--------------------|
|accused              |
|accused_family       |
|appeal               |
|calendarcustom       |
|case_person          |
|commission           |
|complaint            |
|confession           |
|counterstrategy      |
|demonicpact          |

</div>

There are 37 tables included in the database.

b) Display the column names.

```sql
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'accused'
```


<div class="knitsql-table">


Table: Displaying records 1 - 10

|COLUMN_NAME     |
|:---------------|
|row_names       |
|accusedref      |
|accusedsystemid |
|accusedid       |
|firstname       |
|lastname        |
|m_firstname     |
|m_surname       |
|alias           |
|patronymic      |

</div>

There are 32 column names for the table accused.

c) How many people are included in the accused table?

```sql
SELECT COUNT(accusedid)
FROM accused
```


<div class="knitsql-table">


Table: 1 records

|COUNT(accusedid) |
|:----------------|
|3219             |

</div>
Without distinction, there are 3219 people included in the accused table.


```sql
SELECT COUNT(DISTINCT accusedid)
FROM accused
```


<div class="knitsql-table">


Table: 1 records

|COUNT(DISTINCT accusedid) |
|:-------------------------|
|3006                      |

</div>
With distinction, there are 3006 people included in the accused table.

d) Display the columns firstname, sex, and age for 5 cases in the accused table.

```sql
SELECT firstname, sex, age
FROM   accused 
WHERE age > 50
LIMIT 5
```


<div class="knitsql-table">


Table: 5 records

firstname   sex       age
----------  -------  ----
Alexander   Male       75
John        Male       64
Elizabeth   Female     57
Bartie      Male       61
Isobell     Female     60

</div>

e) Count the number of nonmissing values for age in the data.

```sql
SELECT COUNT(age)
FROM accused
```


<div class="knitsql-table">


Table: 1 records

|COUNT(age) |
|:----------|
|166        |

</div>
There are 166 nonmissing values for age in the data.

f) Show a list of unique occupations.

```sql
SELECT DISTINCT occupation
FROM accused
```


<div class="knitsql-table">


Table: Displaying records 1 - 10

|occupation |
|:----------|
|NA         |
|Servant    |
|Vagabond   |
|Weaver     |
|Midwife    |
|Tailor     |
|Messenger  |
|Brewster   |
|Smith      |
|Minister   |

</div>

# 2. Seeing the Devil
a) List the unique devil_types in the data.


```sql
SELECT DISTINCT devil_type
FROM devilappearance
```


<div class="knitsql-table">


Table: Displaying records 1 - 10

|devil_type   |
|:------------|
|Male         |
|Female Fairy |
|Male Fairy   |
|Animal Devil |
|Spirit       |
|Ghost        |
|Other Demon  |
|Female       |
|NA           |
|Fairy        |

</div>

b) How many of the sightings mention the word "black" in the description? 

```sql
SELECT COUNT(devil_text)
FROM devilappearance
WHERE  devil_text LIKE '%black%'
```


<div class="knitsql-table">


Table: 1 records

|COUNT(devil_text) |
|:-----------------|
|121               |

</div>

There are 121 sightings mention the word "black" in the description.

c) What proportion of the devils (in devil_type) are male?

```sql
select devil_type, count(*) * 100.0 / (select count(*) from devilappearance) as percentage
from devilappearance
group by devil_type 
order by percentage desc
```


<div class="knitsql-table">


Table: Displaying records 1 - 10

devil_type           percentage
------------------  -----------
Male                   63.13131
Animal Devil           15.15152
Female                  6.56566
Spirit                  4.29293
Male Fairy              2.27273
Unspecified Devil       2.27273
Female Fairy            1.51515
Ghost                   1.26263
Fairy                   1.01010
NA                      0.50505

</div>

From the table, we can see that about 63.13% the devils (in devil_type) are male.

# 3. The trial

a) What are the average and maximum numbers of male and female accusers?


```sql
SELECT AVG(female_accusers), MAX(female_accusers), AVG(male_accusers), MAX(male_accusers)
FROM   trial 
```


<div class="knitsql-table">


Table: 1 records

AVG(female_accusers)    MAX(female_accusers)   AVG(male_accusers)   MAX(male_accusers)
---------------------  ---------------------  -------------------  -------------------
0.2559                                    27               0.4182                   48

</div>
From the table, we can see that:
The average number of female accusers is 0.2599;
The maximum number of female accusers is 27;
The average number of male accusers is 0.4182;
The maximum number of male accusers is 48.

b) Count the number of sentences by sentence type. List them in a table (in descending order), excluding missing values. Rename the column headings to something sensible.

```sql
SELECT sentence as "sentence type", COUNT(sentence) as number
FROM   trial 
WHERE sentence <> "NA"
GROUP BY sentence
ORDER BY number desc
```


<div class="knitsql-table">


Table: Displaying records 1 - 10

sentence type         number
-------------------  -------
Execution                205
Released                  52
Banishment                27
Declared Fugitive         11
Excommunicated             6
Put to the horn            2
Hang                       1
Branded                    1
Prison                     1
Public Humiliation         1

</div>
c) Do the number of accusers matter for the verdict? Compare the average number of accusers by the type of verdict. Again make sure the table is sorted and the headings make sense.


```sql
SELECT verdict as "verdict type", avg(female_accusers + male_accusers) as "average number of accusers"
FROM   trial 
WHERE verdict <> "NA"
GROUP BY verdict
ORDER BY "average number of accusers" desc
```


<div class="knitsql-table">


Table: 4 records

verdict type    average number of accusers
-------------  ---------------------------
Guilty                              5.8043
Not Guilty                          4.5581
Not Proven                          1.0000
Half Guilty                         0.2857

</div>

4. Tortured Truth (Bonus)
a) Left join the trial and confession tables. For what share of trials does the database record confessions? Create a results table with the number of all trials, the number of confessions, and the share of trials with confessions recorded.


```sql
SELECT 
COUNT(confession.confessionid) AS "number of confession",
COUNT(trial.trialid) AS "number of trial",
ROUND(COUNT(confession.confessionid)/COUNT(trial.trialid) * 100, 2) AS "share of confession"
From trial
LEFT JOIN confession
ON confession.trialref = trial.trialref 
```


<div class="knitsql-table">


Table: 1 records

number of confession    number of trial   share of confession
---------------------  ----------------  --------------------
941                                3396                 27.71

</div>

From the table, we can see that 27.71% share of trials record confessions.


b) Only a small number of trials have records of torture. Is there a higher share of confessions among trials with records of torture than trials without such record?


```sql
SELECT 
COUNT(confession.confessionid) AS "number of confession",
COUNT(trial.trialid) AS "number of trial",
ROUND(COUNT(confession.confessionid)/COUNT(trial.trialid) * 100, 2) AS "share of confession"
From trial
LEFT JOIN confession ON confession.trialref = trial.trialref
LEFT JOIN torture ON confession.trialref = torture.trialref
WHERE tortureid is not null
```


<div class="knitsql-table">


Table: 1 records

number of confession    number of trial   share of confession
---------------------  ----------------  --------------------
40                                   40                   100

</div>



```sql
SELECT 
COUNT(confession.confessionid) AS "number of confession",
COUNT(trial.trialid) AS "number of trial",
ROUND(COUNT(confession.confessionid)/COUNT(trial.trialid) * 100, 2) AS "share of confession"
From trial
LEFT JOIN confession ON confession.trialref = trial.trialref
LEFT JOIN torture ON confession.trialref = torture.trialref
WHERE tortureid is null
```


<div class="knitsql-table">


Table: 1 records

number of confession    number of trial   share of confession
---------------------  ----------------  --------------------
906                                3361                 26.96

</div>

Yes, there is a higher share of confessions among trials with records of torture than trials without such record.
With records of torture, the share is 100%, while without such record, the share is 26.96%.
