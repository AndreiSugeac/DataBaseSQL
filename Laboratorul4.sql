#EX2
SELECT ROUND(MAX(SALARY)) AS "MAXIM", ROUND(MIN(SALARY)) AS "MINIM", ROUND(SUM(SALARY)) AS "SUMA", ROUND(AVG(SALARY)) AS MEDIA
FROM EMPLOYEES;

#EX3
SELECT ROUND(MAX(SALARY)) AS "MAXIM", ROUND(MIN(SALARY)) AS "MINIM", ROUND(SUM(SALARY)) AS "SUMA", ROUND(AVG(SALARY)) AS MEDIA
FROM EMPLOYEES
GROUP BY JOB_ID;

#EX4
SELECT JOB_ID, COUNT(JOB_ID)  AS "NR. ANGAJATI"
FROM EMPLOYEES
GROUP BY JOB_ID;

#EX5
SELECT MANAGER_ID, COUNT(MANAGER_ID) AS "NR. MANAGERI"
FROM EMPLOYEES
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID;

#EX6
SELECT MAX(SALARY) - MIN(SALARY) DIFF
FROM EMPLOYEES;

#EX7
SELECT T1.DEPARTMENT_ID, T1.DEPARTMENT_NAME, T2.LOCATION_ID, COUNT(T3.JOB_ID), AVG(T3.SALARY)
FROM DEPARTMENTS T1
JOIN EMPLOYEES T3 ON T3.DEPARTMENT_ID = T1.DEPARTMENT_ID
INNER JOIN LOCATIONS T2 ON T2.LOCATION_ID = T1.LOCATION_ID
GROUP BY (T1.DEPARTMENT_ID, T1.DEPARTMENT_NAME, T2,LOCATION_ID);

#EX8
SELECT EMPLOYEE_ID, LAST_NAME
FROM EMPLOYEES
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES)
ORDER BY SALARY DESC;

#EX9
SELECT MANAGER_ID, MIN(SALARY)
FROM EMPLOYEES
GROUP BY MANAGER_ID
HAVING MANAGER_ID IS NOT NULL AND MIN(SALARY) > 1000
ORDER BY MIN(SALARY) DESC;

#EX10
SELECT T1.DEPARTMENT_ID, T1.DEPARTMENT_NAME, MAX(T2.SALARY)
FROM DEPARTMENTS T1
INNER JOIN EMPLOYEES T2 ON T1.DEPARTMENT_ID = T2.DEPARTMENT_ID
GROUP BY (T1.DEPARTMENT_ID, T1.DEPARTMENT_NAME)
HAVING MAX(SALARY) > 3000;

#EX11
SELECT  MIN(SALARY)
FROM (SELECT ROUND(AVG(SALARY)) SALARY
      FROM EMPLOYEES
      GROUP BY JOB_ID);
      
#EX12
SELECT T1.DEPARTMENT_ID, T1.DEPARTMENT_NAME, SUM(T2.SALARY)
FROM DEPARTMENTS T1
INNER JOIN EMPLOYEES T2 ON T1.DEPARTMENT_ID = T2.DEPARTMENT_ID
GROUP BY (T1.DEPARTMENT_ID, T1.DEPARTMENT_NAME);

#EX13
SELECT MAX(SALARY)
FROM (SELECT ROUND(AVG(T1.SALARY)) SALARY, T2.DEPARTMENT_ID
      FROM EMPLOYEES T1
      INNER JOIN DEPARTMENTS T2 ON T1.DEPARTMENT_ID = T2.DEPARTMENT_ID
      GROUP BY T2.DEPARTMENT_ID);

#EX14
SELECT T1.JOB_ID, T1.JOB_TITLE, T2.SALARY
FROM (SELECT JOB_ID, ROUND(AVG(SALARY)) SALARY
      FROM EMPLOYEES
      GROUP BY JOB_ID
      ORDER BY SALARY) T2
INNER JOIN JOBS T1 ON T1.JOB_ID = T2.JOB_ID;

#EX15
SELECT ROUND(AVG(SALARY)) SALARY
FROM  EMPLOYEES
HAVING ROUND(AVG(SALARY)) > 2500;

#EX16
SELECT DEPARTMENT_ID, JOB_ID, SUM(SALARY)
FROM EMPLOYEES
GROUP BY(DEPARTMENT_ID, JOB_ID);

#EX17
SELECT T1.DEPARTMENT_NAME, T2.SALMIN
FROM (SELECT DEPARTMENT_ID, SALMIN FROM (
        SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)), MIN(SALARY) SALMIN
        FROM EMPLOYEES
        GROUP BY DEPARTMENT_ID 
        ORDER BY ROUND(AVG(SALARY)) DESC)) T2
INNER JOIN DEPARTMENTS T1 ON T2.DEPARTMENT_ID = T1.DEPARTMENT_ID;

